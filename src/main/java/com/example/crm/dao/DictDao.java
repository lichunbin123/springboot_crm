package com.example.crm.dao;

import com.example.crm.bean.dict;
import com.example.crm.mapper.DictMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DictDao {

    private final DictMapper dictMapper;

    @Autowired
    public DictDao(DictMapper dictMapper) {
        this.dictMapper = dictMapper;
    }

    public List<dict> findAll() throws DataAccessException {
        return dictMapper.findAll();
    }
}
