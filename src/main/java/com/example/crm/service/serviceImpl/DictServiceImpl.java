package com.example.crm.service.serviceImpl;

import com.example.crm.dao.DictDao;
import com.example.crm.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
public class DictServiceImpl implements DictService  {

    private final DictDao dictDao;

    @Autowired
    public DictServiceImpl(DictDao dictDao) {
        this.dictDao = dictDao;
    }

    @Override
    public List ResponseMessage() {
        return dictDao.findAll();
    }
}
