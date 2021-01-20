package com.zensar;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmployeeController {
	
	@Autowired
	Employee employee;
	
	@Autowired
	EmployeeRepository employeeRepository;
	
	@RequestMapping("/")
	public ModelAndView openIndexPage() {
		ModelAndView modelAndView = new ModelAndView("index.jsp");
		return modelAndView;
		
	}
	
	@RequestMapping("/addEmployee")
	public ModelAndView addEmployeeForm(@RequestParam("employeeId") int empId, @RequestParam("employeeName") String empName, @RequestParam("designation") String dest, @RequestParam("salary") int salary, @RequestParam("gender")String gender,@RequestParam("city") String city) {
		System.out.println("Inside AddEmployee");
		
		employee.setEmployeeId(empId);
		employee.setEmployeeName(empName);
		employee.setDesignation(dest);
		employee.setSalary(salary);
		employee.setGender(gender);
		employee.setCity(city);
		
		System.out.println(employee);
		
		employeeRepository.save(employee);
		ModelAndView modelAndView = new ModelAndView("index.jsp");
		return modelAndView;
		
	}

	@RequestMapping(value="/viewAll")
	public ModelAndView viewAllEmployee() {
		
		List<Employee> listOfAllEmployees = new ArrayList<Employee>();
		listOfAllEmployees = employeeRepository.findAll();
	
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("viewAllEmployee.jsp");
		
		modelAndView.addObject("listOfAllEmployees", listOfAllEmployees);
		
		return modelAndView;
		
	}

	@RequestMapping("/delete")
	public ModelAndView deleteEmployee(@RequestParam("employeeId") int empId) {
		
		employeeRepository.deleteById(empId);
		ModelAndView modelAndView = new ModelAndView("index.jsp");
		return modelAndView;
	}
	
	@RequestMapping("/openUpdateForm")
	public ModelAndView updateEmployee(@RequestParam("employeeId") int employeeId) {
		
		Employee employee = employeeRepository.findById(employeeId).orElse(null);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("updateEmployeeForm.jsp");
		modelAndView.addObject("employee", employee);
		return modelAndView;
	}
	
	@RequestMapping("/updateDetails")
	public ModelAndView updateEmployee2(@RequestParam("employeeId") int employeeId, @RequestParam("employeeName") String employeeName, @RequestParam("designation") String designation, @RequestParam("salary") int salary, @RequestParam("gender")String gender,@RequestParam("city") String city) {
		Employee employee = new Employee(employeeId, employeeName, designation, salary, gender, city);
		employeeRepository.saveAndFlush(employee);
		
		ModelAndView modelAndView = new ModelAndView("index.jsp");
		
		return modelAndView;
	
	}
	
}
