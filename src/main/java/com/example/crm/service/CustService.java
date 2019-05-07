package com.example.crm.service;

import com.example.crm.bean.SearchCust;
import com.example.crm.bean.customer;

import java.util.List;

public interface CustService {
    public List ResponseMessage();

    public List<customer> EditCust(int id);

    public void updateCustomer(customer cust);

    public void deleteCustomer(int id);

    public List<customer> search(SearchCust cust);
}
