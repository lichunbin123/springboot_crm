package com.example.crm.mapper;

import com.example.crm.bean.dict;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface DictMapper {
    /**
     * 找到所有dict信息
     * @return
     */
    List<dict> findAll() throws DataAccessException;
}
