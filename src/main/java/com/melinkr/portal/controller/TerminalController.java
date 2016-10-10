package com.melinkr.portal.controller;


import com.melinkr.common.model.PageModelForDatatable;
import com.melinkr.common.rpc.page.RpcPageInfoForDatatable;
import com.melinkr.terminal.entity.Terminal;
import com.melinkr.terminal.service.rpc.TerminalRpcService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

/**
 * Created by miller(scofeild806@gmail.com) on 2016/9/22.
 */
@RestController
@RequestMapping("terminal")
public class TerminalController {
    @Autowired
    TerminalRpcService terminalRpcService;

    @RequestMapping(value = "query", method = RequestMethod.GET)
    public RpcPageInfoForDatatable<Terminal> datatables(PageModelForDatatable p) {
        Terminal t = new Terminal();
        t.setChipModel("111");
        return terminalRpcService.selectListWithPageForDatatable(t, p);
    }
}
