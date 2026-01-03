package com.project.ecom.repository;

import com.project.ecom.entity.Order;
import com.project.ecom.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {
    Order findByUser(User user);

    List<Order> findOrdersByUser(User user);

    public Long countById(Integer id);

}
