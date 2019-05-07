package com.example.crm.service.serviceImpl;

import com.example.crm.bean.SearchCust;
import com.example.crm.bean.customer;
import com.example.crm.dao.CustDao;
import com.example.crm.service.CustService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
public class CustServiceImpl implements CustService {
    private final CustDao custDao;
    @Autowired
    public CustServiceImpl(CustDao custDao) {
        this.custDao = custDao;
    }

    @Override
    public List ResponseMessage() {
        return custDao.findAll();
    }

    @Override
    public List<customer> EditCust(int id) {
        return custDao.findById(id);
    }

    @Override
    public void updateCustomer(customer cust) {
         custDao.updateCustomer(cust);
    }

    @Override
    public void deleteCustomer(int id) {
        custDao.deleteCustomer(id);
    }

    @Override
    public List<customer> search(SearchCust cust) {
        return custDao.search(cust);
    }
}
