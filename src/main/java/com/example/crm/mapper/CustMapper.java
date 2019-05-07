package com.example.crm.mapper;

import com.example.crm.bean.SearchCust;
import com.example.crm.bean.customer;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface CustMapper {
    /**
     * 查询出costomer表数据
     * @return
     * @throws DataAccessException
     */
    List<customer> findAll() throws DataAccessException;

    List<customer> findById(int id) throws DataAccessException;

    void updateCustomer(customer cust) throws DataAccessException;

    void deleteCustomer(int id) throws DataAccessException;

    List<customer> search(SearchCust cust) throws DataAccessException;
}
