package com.xx.tmall.service.impl;

import com.xx.tmall.mapper.PropertyMapper;
import com.xx.tmall.pojo.Product;
import com.xx.tmall.pojo.Property;
import com.xx.tmall.pojo.PropertyValue;
import com.xx.tmall.mapper.PropertyValueMapper;
import com.xx.tmall.pojo.PropertyValueExample;
import com.xx.tmall.service.PropertyService;
import com.xx.tmall.service.PropertyValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PropertyValueServiceImpl implements PropertyValueService{
    @Autowired
    PropertyValueMapper propertyValueMapper;
    @Autowired
    PropertyService propertyService;
    @Override
    public void init(Product p) {
        List<Property> pts = propertyService.list(p.getCid());

        for (Property pt : pts){
            PropertyValue pv = get(pt.getId(),p.getId());
            if (null == pv){
                pv = new PropertyValue();
                pv.setPid(p.getId());
                pv.setPtid(pt.getId());
                propertyValueMapper.insert(pv);
            }
        }
    }

    @Override
    public List<PropertyValue> list(int pid) {
        PropertyValueExample example = new PropertyValueExample();
        example.createCriteria().andPidEqualTo(pid);
        List<PropertyValue> pvs = propertyValueMapper.selectByExample(example);
        for (PropertyValue pv : pvs){
            Property pt = propertyService.get(pv.getPtid());
            pv.setProperty(pt);
        }
        return pvs;
    }

    @Override
    public PropertyValue get(int ptid, int pid) {
        PropertyValueExample example = new PropertyValueExample();
        example.createCriteria().andPtidEqualTo(ptid).andPidEqualTo(pid);
        List<PropertyValue> pvs = propertyValueMapper.selectByExample(example);
        if (pvs.isEmpty())
            return null;
        return pvs.get(0);
    }

    @Override
    public void update(PropertyValue pv) {
        propertyValueMapper.updateByPrimaryKeySelective(pv);
    }
}
