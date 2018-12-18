package com.pace2car.controller;

import com.pace2car.bean.Interview;
import com.pace2car.bean.RecruitInfo;
import com.pace2car.bean.Resume;
import com.pace2car.service.InterviewService;
import com.pace2car.service.RecruitInfoService;
import com.pace2car.service.ResumeService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * 招聘管理
 * @author Pace2Car
 * @date 2018/12/12 10:52
 */
@Controller
@RequestMapping("/recruit")
public class RecruitController {

    static Logger logger = Logger.getLogger(RecruitController.class);

    @Autowired
    private RecruitInfoService recruitInfoService;

    @Autowired
    private ResumeService resumeService;

    @Autowired
    private InterviewService interviewService;

    @RequestMapping("/addRecruit")
    public String addRecruit() {
        return "addRecruit";
    }

    @RequestMapping("/insertRecruit")
    public void insertRecruit(RecruitInfo recruitInfo, HttpServletResponse response) {
        logger.info("insert resume -> name : " + recruitInfo.getTitle());
        try {
            if (recruitInfoService.insertSelective(recruitInfo) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            logger.warn("insert resume fail -> name : " + recruitInfo.getTitle());
            e.printStackTrace();
        }
    }

    @RequestMapping("/searchRecruit")
    public String searchRecruit(RecruitInfo recruitInfo, ModelMap modelMap, HttpSession session) {
        List<RecruitInfo> recruitInfos = null;
        if (recruitInfo != null && recruitInfo.getId() != null) {
            logger.info("resume" + recruitInfo.getId());
            RecruitInfo oldRecruit = recruitInfoService.selectByPrimaryKey(recruitInfo.getId());
            modelMap.addAttribute("oldRecruit", oldRecruit);
            return "updateRecruit";
        }
        logger.info("search recruitInfos ...... ");
        recruitInfos = recruitInfoService.selectRecruitInfos(recruitInfo);
        modelMap.addAttribute("recruitInfos", recruitInfos);
        session.setAttribute("recruitInfo", recruitInfo);

        return "recruitList";
    }

    @RequestMapping("/editStatusRecruit")
    public void editStatusRecruit(RecruitInfo recruitInfo, HttpServletResponse response) {
        logger.info("editStatus recruit -> id : " + recruitInfo.getId());
        RecruitInfo oldRecruit = recruitInfoService.selectByPrimaryKey(recruitInfo.getId());
        if (oldRecruit.getStatus() == 1) {
            recruitInfo.setStatus(0);
        } else {
            recruitInfo.setStatus(1);
        }
        try {
            if (recruitInfoService.updateByPrimaryKeySelective(recruitInfo) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            logger.warn("editStatus recruit fail -> id : " + recruitInfo.getId());
            e.printStackTrace();
        }
    }

    @RequestMapping("/updateRecruit")
    public void updateRecruit(RecruitInfo recruitInfo, HttpServletResponse response) {
        logger.info("update recruit -> id : " + recruitInfo.getId());
        try {
            if (recruitInfoService.updateByPrimaryKeySelective(recruitInfo) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            logger.warn("update recruit fail -> id : " + recruitInfo.getId());
            e.printStackTrace();
        }
    }

    @RequestMapping("/searchResume")
    public String searchResume(Resume resume, ModelMap modelMap, HttpSession session) {
        List<Resume> resumes = null;
        logger.info("search resume ...... ");
        resumes = resumeService.selectResumes(resume);
        modelMap.addAttribute("resumes", resumes);
        session.setAttribute("resume", resume);

        return "resumeList";
    }

    @RequestMapping("/updateResume")
    public void updateResume(Resume resume, HttpServletResponse response) {
        logger.info("update resume -> id : " + resume.getId());
        logger.info("update resume -> result : " + resume.getResult());
        if (resume.getResult() == 1) {
            Resume passResume = resumeService.selectByPrimaryKey(resume.getId());
            Interview interview = new Interview();
            interview.setName(passResume.getName());
            interview.setPhoneNo(passResume.getPhoneNo());
            interviewService.insertSelective(interview);
        }
        resume.setStatus(1);
        try {
            if (resumeService.updateByPrimaryKeySelective(resume) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            logger.warn("update resume fail -> id : " + resume.getId());
            e.printStackTrace();
        }
    }

    @RequestMapping("/searchInterview")
    public String searchInterview(Interview interview, ModelMap modelMap, HttpSession session) {
        List<Interview> interviews = null;
        logger.info("search interviews ...... ");
        interviews = interviewService.selectInterviews(interview);
        modelMap.addAttribute("interviews", interviews);
        session.setAttribute("interview", interview);

        return "interviewList";
    }

    @RequestMapping("/updateInterview")
    public void updateInterview(Interview interview, HttpServletResponse response) {
        logger.info("update interview -> id : " + interview.getId());
        interview.setStatus(1);
        try {
            if (interviewService.updateByPrimaryKeySelective(interview) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            logger.warn("update interview fail -> id : " + interview.getId());
            e.printStackTrace();
        }
    }
}
