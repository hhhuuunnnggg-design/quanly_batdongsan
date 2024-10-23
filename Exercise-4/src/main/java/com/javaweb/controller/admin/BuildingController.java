package com.javaweb.controller.admin;

import javax.servlet.http.HttpServletRequest;

import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.BuildingService;
import com.javaweb.service.IUserService;
import com.javaweb.service.impl.UserService;
import com.javaweb.utils.DisplayTagUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.util.ArrayList;
import java.util.List;

@Controller(value = "buildingControllerOfAdmin")
// Ở cái @Controller thì RequestMethod đều là GET
// vì controler ở đây là đang lấy gia diện
public class BuildingController {
    @Autowired
    private IUserService userService;

    @Autowired
    private BuildingService buildingService;

    // view của danh sách tòa nhà
    // @RequestMapping không nhận 3 cấp vd /admin/building/list
    @RequestMapping(value = "/admin/building-list", method = RequestMethod.GET)
    // @ModelAttribute giúp buildingDTO nhận dữ liệu trên params
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest,
            HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/list");

        DisplayTagUtils.of(request, buildingSearchRequest);
        List<BuildingSearchResponse> responseList = buildingService.findAll(buildingSearchRequest,
                PageRequest.of(buildingSearchRequest.getPage() - 1, buildingSearchRequest.getMaxPageItems()));
        buildingSearchRequest.setListResult(responseList);

        mav.addObject("modelSearch", buildingSearchRequest);
        mav.addObject("listStaffs", userService.getStaffs());
        mav.addObject("districts", districtCode.type());
        mav.addObject("typeCodes", buildingType.type());
        return mav;
    }

    // view của thêm tòa nhà
    @RequestMapping(value = "/admin/building-edit", method = RequestMethod.GET)
    public ModelAndView buildingEdit(@ModelAttribute BuildingDTO buildingDTO, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("buildingEdit", buildingDTO);

        mav.addObject("districts", districtCode.type());
        mav.addObject("typeCodes", buildingType.type());

        return mav;
    }

    // view của sửa tòa nhà voi id
    @RequestMapping(value = "/admin/building-edit-{id}", method = RequestMethod.GET)
    public ModelAndView buildingEdit(@PathVariable("id") Long Id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        BuildingDTO buildingDTO = new BuildingDTO();
        buildingDTO.setId(Id);
        buildingDTO.setName("Building");
        buildingDTO.setAddress("tan chau tay ninh");
        buildingDTO.setNumberOfBasement(2L);
        buildingDTO.setLevel(5l);
        mav.addObject("buildingEdit", buildingDTO);
        // xuống db tìm building theo id
        mav.addObject("districts", districtCode.type());
        mav.addObject("typeCodes", buildingType.type());
        return mav;
    }

}
