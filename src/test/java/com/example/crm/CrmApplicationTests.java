package com.example.crm;

import com.example.crm.bean.dict;
import com.example.crm.dao.DictDao;
import com.example.crm.mapper.DictMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CrmApplicationTests {
    private final Logger logger = LoggerFactory.getLogger(CrmApplicationTests.class);
    @Autowired
    private DictDao dictDao;

    @Test
    public void findAll(){
        List<dict> dicts = dictDao.findAll();
        System.out.println("数目是="+dicts.size());
        logger.info("数目是+"+dicts.size());
    }

    @Override
    public int hashCode() {
        return super.hashCode();
    }
}
