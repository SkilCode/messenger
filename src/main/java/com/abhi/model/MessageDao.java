package com.abhi.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
@Component
public interface MessageDao extends JpaRepository<Message, Integer> {
		
}
