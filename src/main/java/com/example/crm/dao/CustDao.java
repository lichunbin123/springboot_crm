package com.example.crm.dao;

import com.example.crm.bean.SearchCust;
import com.example.crm.bean.customer;
import com.example.crm.mapper.CustMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustDao {
    private CustMapper custMapper;
    @Autowired
    public CustDao(CustMapper custMapper) {
        this.custMapper = custMapper;
    }

    public List<customer> findAll() throws DataAccessException {
        return custMapper.findAll();
    }

    public List<customer> findById(int id) throws DataAccessException{
        return custMapper.findById(id);
    }

    public void updateCustomer(customer cust) throws DataAccessException{
        custMapper.updateCustomer(cust);
    }

    public void deleteCustomer(int id) throws DataAccessException{
        custMapper.deleteCustomer(id);
    }

    public List<customer> search(SearchCust cust) throws DataAccessException{
        return custMapper.search(cust);
    }
}
