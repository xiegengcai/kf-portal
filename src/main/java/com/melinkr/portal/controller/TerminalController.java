package com.melinkr.portal.controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

/**
 * Created by miller(scofeild806@gmail.com) on 2016/9/22.
 */
@RestController
@RequestMapping("/terminal")
public class TerminalController {
//    @Autowired
//    TerminalRpcService terminalRpcService;
//
//    @RequestMapping("/getAll")
//    public RpcPageInfoForDatatable<Terminal> datatables(PageModelForDatatable p) {
//        Terminal t = new Terminal();
//        t.setChipModel("111");
//        return terminalRpcService.selectListWithPageForDatatable(t, p);
//    }
    @RequestMapping("/json/test")
    public Object test() {
        return new HashMap<>();
    }
}
