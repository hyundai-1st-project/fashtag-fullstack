package org.betweenls.fashtag.global.s3;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.PutObjectRequest;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Slf4j
@RequiredArgsConstructor
@Getter
@Service
public class S3UploaderService {

    private final AmazonS3 amazonS3;

    private final AmazonS3Client amazonS3Client;

    @Value("${cloud.aws.s3.bucket}")
    private String bucket;

    @Value("${cloud.aws.region.static}")
    private String region;

    @Value("${cloud.aws.s3.bucket.url}")
    private String url;

    public String convertFile(MultipartFile multipartFile, String dirName, String basicFileName) throws IOException {
    
        // MultipartFile -> File로 전환 :: S3에 MultipartFile 타입은 전송 x
        File convFile = new File(multipartFile.getOriginalFilename());
        convFile.createNewFile();
        FileOutputStream fos = new FileOutputStream(convFile);
        fos.write(multipartFile.getBytes());
        fos.close();
        return upload(convFile, dirName, basicFileName);
    }

    // S3로 파일 업로드
    public String upload(File uploadFile, String dirName, String basicFileName) {
        String fileName = dirName + "/" + basicFileName;
        String uploadImageUrl = putS3(uploadFile, fileName);
//        removeNewFile(uploadFile);
        return fileName;
    }

    private String putS3(File uploadFile, String fileName) {
        amazonS3.putObject(new PutObjectRequest(bucket, fileName, uploadFile).withCannedAcl(CannedAccessControlList.PublicRead));
        return amazonS3.getUrl(bucket, fileName).toString();
    }

    /**
     * @description 로컬에 저장된 파일 지우기
     */
    private void removeNewFile(File targetFile) {
        if (targetFile.delete()) {
            log.info("파일이 삭제되었습니다.");
            return;
        }
        log.info("파일이 삭제되지 못했습니다.");
    }

    /**
     * S3에 업로드된 파일 삭제
     */
    public String deleteFile(String objectKey) {
        String result = "success";
        try {
            amazonS3.deleteObject(new DeleteObjectRequest(bucket, objectKey));
        } catch (Exception e) {
            log.debug("Delete File failed", e);
        }
        return result;
    }

}