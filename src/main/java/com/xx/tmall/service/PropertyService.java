package com.xx.tmall.service;

import com.xx.tmall.pojo.Property;

import java.util.List;

public interface PropertyService {
    List<Property> list(int cid);
    void add(Property property);
    void delete(int id);
    void update(Property property);
    Property get(int id);
}
