package com.pace2car.controller;

import com.pace2car.bean.Train;
import com.pace2car.shiro.bean.User;
import com.pace2car.service.TrainService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/14 14:04
 */
@Controller
@RequestMapping("/train")
public class TrainController {

    static Logger logger = Logger.getLogger(TrainController.class);

    @Autowired
    private TrainService trainService;

    @RequestMapping("/addTrain")
    public String addTrain() {
        return "addTrain";
    }

    @RequestMapping("/insertTrain")
    public void insertRecruit(Train train, HttpServletResponse response) {
        logger.info("insert train -> name : " + train.getSubject());
        try {
            if (trainService.insertSelective(train) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            logger.warn("insert train fail -> name : " + train.getSubject());
            e.printStackTrace();
        }
    }

    @RequestMapping("/searchTrain")
    public String searchResume(Train train, ModelMap modelMap, HttpSession session) {
        List<Train> trains = null;
        if (train != null && train.getId() != null) {
            logger.info("searchEmployee" + train.getId());
            Train oldTrain = trainService.selectByPrimaryKey(train.getId());
            modelMap.addAttribute("oldTrain", oldTrain);
            if (train.getStatus() != null && train.getStatus() == 3) {
                return "reApplyTrain";
            }
            return "trainDetail";
        }
        logger.info("search trains ...... ");
        if (train == null) {
            train = new Train();
        }
        getTrains(train, modelMap, session);
        return "trainList";
    }

    @RequestMapping("/checkMyTrain")
    public String checkMyTrain(Train train, ModelMap modelMap, HttpSession session) {
        User logUser = (User) session.getAttribute("logUser");
        logger.info(logUser.getEmpNo());
        List<Train> trains = null;
        logger.info("search myTrains ...... ");
        if (train == null) {
            train = new Train();
        }
        train.setEmpNo(logUser.getEmpNo());
        getTrains(train, modelMap, session);
        return "myTrainList";
    }

    private void getTrains(Train train, ModelMap modelMap, HttpSession session) {
        List<Train> trains;
        train.setEndTime(new Date(System.currentTimeMillis()));
        logger.info(new Date(System.currentTimeMillis()));
        trains = trainService.selectTrains(train);
        modelMap.addAttribute("trains", trains);
        session.setAttribute("train", train);
    }

    @RequestMapping("/updateTrain")
    public void updateTrain(Train train, HttpServletResponse response) {
        logger.info("update train -> name : " + train.getId());
        try {
            if (trainService.updateByPrimaryKeySelective(train) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            logger.warn("update train fail -> name : " + train.getId());
            e.printStackTrace();
        }
    }

    @RequestMapping("/reApplyTrain")
    public void reApplyTrain(Train train, HttpServletResponse response) {
        logger.info("reApply train -> name : " + train.getId());
        train.setStatus(0);
        train.setRefuseReason("");
        try {
            if (trainService.updateByPrimaryKeySelective(train) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            logger.warn("reApply train fail -> name : " + train.getId());
            e.printStackTrace();
        }
    }
}
