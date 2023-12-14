package org.betweenls.fashtag.global.Controller;


import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Slf4j
@AllArgsConstructor
public class IndexController {

    @GetMapping("/")
    public String index() {
        return "index";
    }
}
