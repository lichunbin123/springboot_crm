package com.example.crm.controller;

import com.example.crm.bean.SearchCust;
import com.example.crm.bean.customer;
import com.example.crm.service.CustService;
import com.example.crm.service.DictService;
import com.example.crm.service.serviceImpl.ImportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;
import java.util.List;


@Controller
public class CrmController{
    private DictService dictService;
    private CustService custService;
    private ImportService importService;
    @Autowired
    public CrmController(DictService dictService,CustService custService,ImportService importService) {
        this.dictService = dictService;
        this.custService = custService;
        this.importService = importService;
    }

    @RequestMapping(value = "/customer")
    public String customer(Model model){
        model.addAttribute("fromType",dictService.ResponseMessage());
        model.addAttribute("industryType",dictService.ResponseMessage());
        model.addAttribute("levelType",dictService.ResponseMessage());
        model.addAttribute("rows",custService.ResponseMessage());
        return "customer";
    }
    @RequestMapping(value = "/sort")
    public String sort(Model model){
        return "sort";
    }
    @RequestMapping(value = "/fenye")
    public String fenye(Model model){
        return "fenye";
    }
    @RequestMapping(value = "/list_010")
    public String list(Model model){
        return "list_010";
    }

    @RequestMapping(value = "/customer/edit.action")
    @ResponseBody
    public customer EditCust(@RequestParam int id){
        List<customer> list = custService.EditCust(id);
        return list.get (0);
    }

    @RequestMapping(value = "/customer/update.action")
    public String UpdateCust(customer cust){
        custService.updateCustomer(cust);
        return "customer";
    }

    @RequestMapping(value = "/customer/delete.action")
    public String DeleteCust(@RequestParam int id){
        custService.deleteCustomer(id);
        return "customer";
    }

    @RequestMapping(value = "/customer/list.action")
    public String ListCust(SearchCust cust,Model model){
        System.out.println("======"+cust.getCustIndustry());
        model.addAttribute("fromType",dictService.ResponseMessage());
        model.addAttribute("industryType",dictService.ResponseMessage());
        model.addAttribute("levelType",dictService.ResponseMessage());
        model.addAttribute("rows",custService.search(cust));
        return "customer";
    }

    @PostMapping(value = "/upload.action")
    @ResponseBody
    public String uploadExcel(HttpServletRequest request) throws Exception {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

        MultipartFile file = multipartRequest.getFile("filename");
        if (file.isEmpty()) {
            return "文件不能为空";
        }
        InputStream inputStream = file.getInputStream();
        List<List<Object>> list = importService.getBankListByExcel(inputStream, file.getOriginalFilename());
        inputStream.close();

        for (int i = 0; i < list.size(); i++) {
            List<Object> lo = list.get(i);
            System.out.println(lo);
        }
        return "上传成功";
    }

}
