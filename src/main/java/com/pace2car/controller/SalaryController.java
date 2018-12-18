package com.pace2car.controller;

import com.pace2car.bean.Adjustsalary;
import com.pace2car.bean.BonusMulctRecord;
import com.pace2car.bean.Employee;
import com.pace2car.bean.User;
import com.pace2car.service.AdjustsalaryService;
import com.pace2car.service.BonusMulctRecordService;
import com.pace2car.service.EmployeeService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 薪资管理
 *
 * @author Pace2Car
 * @date 2018/12/11 16:11
 */
@Controller
@RequestMapping("/salary")
public class SalaryController {

    static Logger logger = Logger.getLogger(SalaryController.class);

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private AdjustsalaryService adjustsalaryService;

    @Autowired
    private BonusMulctRecordService bonusMulctRecordService;

    @RequestMapping("/searchEmpSalary")
    public String searchEmpSalary(Employee employee, ModelMap modelMap, HttpSession session) {
        List<Employee> employees = null;
        if (employee != null && employee.getEmpNo() != null) {
            logger.info("searchEmpSalary" + employee.getEmpNo());
            Employee oldEmployee = employeeService.selectByPrimaryKey(employee.getEmpNo());
            modelMap.addAttribute("oldEmployee", oldEmployee);
            session.setAttribute("oldEmployee", oldEmployee);
            return "updateEmpSalary";
        }
        employees = employeeService.selectEmployees(employee);
        modelMap.addAttribute("employees", employees);
        session.setAttribute("employee", employee);

        return "empSalaryList";
    }

    @RequestMapping("/updateEmpSalary")
    public void updateEmpSalary(Adjustsalary adjustsalary, HttpServletResponse response, HttpSession session) {
        Employee oldEmployee = (Employee) session.getAttribute("oldEmployee");
        logger.info(oldEmployee.getBaseSalary());
        adjustsalary.setBeforesalary(oldEmployee.getBaseSalary());
        oldEmployee.setBaseSalary(adjustsalary.getAftersalary());
        adjustsalaryService.insertSelective(adjustsalary);
        logger.info("update employee -> name : " + oldEmployee.getEmpName());
        try {
            if (employeeService.updateByPrimaryKeySelective(oldEmployee) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/searchEmpBM")
    public String searchEmpBM(Employee employee, ModelMap modelMap, HttpSession session) {
        List<Employee> employees = null;
        if (employee != null && employee.getEmpNo() != null) {
            logger.info("searchEmpBM" + employee.getEmpNo());
            Employee oldEmployee = employeeService.selectByPrimaryKey(employee.getEmpNo());
            modelMap.addAttribute("oldEmployee", oldEmployee);
            session.setAttribute("oldEmployee", oldEmployee);
            return "updateEmpBM";
        }
        employees = employeeService.selectEmployees(employee);
        modelMap.addAttribute("employees", employees);
        session.setAttribute("employee", employee);

        return "empBMList";
    }

    @RequestMapping("/updateEmpBM")
    public void updateEmpBM(BonusMulctRecord bonusMulctRecord, HttpServletResponse response, HttpSession session) {
        Employee oldEmployee = (Employee) session.getAttribute("oldEmployee");
        logger.info(oldEmployee.getEmpNo());
        if (bonusMulctRecord.getBmType() == 1) {
            oldEmployee.setBonus(oldEmployee.getBonus() + bonusMulctRecord.getBmAmount());
        } else {
            oldEmployee.setMulct(oldEmployee.getMulct() + bonusMulctRecord.getBmAmount());
        }
        bonusMulctRecordService.insertSelective(bonusMulctRecord);

        logger.info("update employee -> name : " + oldEmployee.getEmpName());
        try {
            if (employeeService.updateByPrimaryKeySelective(oldEmployee) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            logger.info("update employee fail -> name : " + oldEmployee.getEmpName());
            e.printStackTrace();
        }
    }

    @RequestMapping("/cheakMySalary")
    public String cheakMySalary(ModelMap modelMap, HttpSession session) {
        getMySalary(modelMap, session);
        return "mySalary";
    }

    @RequestMapping("/printMySalary")
    public String printMySalary(ModelMap modelMap, HttpSession session) {
        getMySalary(modelMap, session);
        return "mySalary_print";
    }

    private void getMySalary(ModelMap modelMap, HttpSession session) {
        User logUser = (User) session.getAttribute("logUser");
        logger.info(logUser.getEmpNo());
        Employee mySalary = employeeService.selectSalByPrimaryKey(logUser.getEmpNo());
        modelMap.addAttribute("mySalary", mySalary);
        double totalSal = mySalary.getBaseSalary() + mySalary.getBonus() - mySalary.getMulct();

        double socialSecurity = totalSal * (0.08 + 0.02 + 0.004 + 0.06);
        socialSecurity = (double) Math.round(socialSecurity * 100) / 100;
        double taxSalary = totalSal - socialSecurity - 5000;
        double tax = taxSalary < 0 ? 0.0 :
                taxSalary <= 1500 ? 0.03 * taxSalary :
                        taxSalary <= 4500 ? taxSalary * 0.1 - 105 :
                                taxSalary <= 9000 ? taxSalary * 0.2 - 555 :
                                        taxSalary <= 35000 ? taxSalary * 0.25 - 1005 :
                                                taxSalary <= 55000 ? taxSalary * 0.3 - 2755 :
                                                        taxSalary <= 80000 ? taxSalary * 0.35 - 5505 :
                                                                taxSalary * 0.45 - 13505;
        tax = (double) Math.round(tax * 100) / 100;
        modelMap.addAttribute("tax", tax);
        modelMap.addAttribute("socialSecurity", socialSecurity);
    }

    @RequestMapping("/getSalChart")
    public String getSalChart() {
        return "salaryChart";
    }

    @RequestMapping("/statistics")
    @ResponseBody
    public Map<String, Integer> payrollStat(Employee employee) {
        List<Employee> salList = employeeService.selectSalByDeptNo(employee);
        Map salDistributed = new HashMap<String, Integer>(5);
        int level1 = 0, level2 = 0, level3 = 0, level4 = 0, level5 = 0, level6 = 0;
        for (Employee empSal : salList) {
            double sal = empSal.getBaseSalary();
            if (sal < 5000) {
                level1++;
            } else if (sal <= 10000){
                level2++;
            } else if (sal <= 15000){
                level3++;
            } else if (sal <= 20000){
                level4++;
            } else if (sal <= 30000){
                level5++;
            } else {
                level6++;
            }
        }
        salDistributed.put("level1", level1);
        salDistributed.put("level2", level2);
        salDistributed.put("level3", level3);
        salDistributed.put("level4", level4);
        salDistributed.put("level5", level5);
        salDistributed.put("level6", level6);
        return salDistributed;
    }

}
