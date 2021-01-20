package com.zensar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeService {
	
	@Autowired
	EmployeeRepository employeeRepository;
	
	public Employee save(int employeeId) {
		Employee employee = employeeRepository.save(employeeId);
		return employee;
	}
	
	

}
