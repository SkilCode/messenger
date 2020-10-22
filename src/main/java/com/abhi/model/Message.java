package com.abhi.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

import com.sun.istack.NotNull;
@Component
@Entity
public class Message {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY) 
@NotNull
	int m_id=0;
	String message;

	public String getMessage() {
		return message;
		
	}
	
	public void setMessage(String message) {
		this.message = message;
	}

	public int getM_id() {
		return m_id;
	}

	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	
}
