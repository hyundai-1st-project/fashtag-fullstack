package org.betweenls.fashtag.global.s3;

import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
@Log4j
public class S3ExampleController {

    @Autowired
    private S3UploaderService s3UploaderService;

    @PostMapping("/upload-test")
    public void upload(@RequestPart(value="photo") MultipartFile titlePhoto) throws IOException {

        String basicFileName ="title" ;
        String dirName = "user/userId";  // 폴더 이름
        String courseTitlePhotoKey = s3UploaderService.convertFile(titlePhoto, dirName, basicFileName);
        log.info(courseTitlePhotoKey);
    }

    @DeleteMapping("/file-delete")
    public void delete(String key){
        s3UploaderService.deleteFile(key);
    }

}
