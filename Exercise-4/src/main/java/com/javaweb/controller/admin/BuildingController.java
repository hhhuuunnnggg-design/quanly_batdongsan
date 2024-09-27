package com.javaweb.controller.admin;
import javax.servlet.http.HttpServletRequest;

import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.service.IUserService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.util.ArrayList;
import java.util.List;



@Controller(value="buildingControllerOfAdmin")
// Ở cái @Controller thì RequestMethod đều là GET
// vì controler ở đây là đang lấy gia diện
public class BuildingController {
    @Autowired
    private IUserService userService;

//    view của danh sách tòa nhà
//    @RequestMapping không nhận 3 cấp vd /admin/building/list
    @RequestMapping(value = "/admin/building-list" ,method = RequestMethod.GET)
//                             @ModelAttribute giúp buildingDTO nhận dữ liệu trên params
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) {
        ModelAndView mav=new ModelAndView("admin/building/list");
        mav.addObject("modelSearch", buildingSearchRequest);

        List<BuildingSearchRequest> reqontList=new ArrayList<>();

        BuildingSearchRequest item=new BuildingSearchRequest();
        item.setId(1L);
        item.setName("ACM Building");
        item.setAddress("Âp hội thắng xã tân hiệp huện tân châu tỉnh tây ninh");
        item.setNumberOfBasement(2L);
        item.setManagerName("nguyen cong huy");
        item.setFloorArea(125l);
        item.setRentarea("100,200,300");
        item.setManagerPhone("0612151165125");

        BuildingSearchRequest item2=new BuildingSearchRequest();
        item2.setId(2L);
        item2.setName("Building22");
        item2.setAddress("Thị trấn tân châu tây ninh");
        item2.setNumberOfBasement(2L);
        item2.setManagerName("Hoàng Minh Anh");
        item2.setManagerPhone("061215116512");
        item2.setFloorArea(500l);
        item2.setRentarea("200,300");

        BuildingSearchRequest item3=new BuildingSearchRequest();
        item3.setId(3L);
        item3.setName("Building 3");
        item3.setAddress("Thị trấn tân châu tây ninh");
        item3.setNumberOfBasement(2L);
        item3.setManagerName("Đoàn Huy ANH");
        item3.setManagerPhone("061215116512");
        item3.setFloorArea(500l);
        item3.setRentarea("200,300");

        reqontList.add(item);
        reqontList.add(item2);
        reqontList.add(item3);

//        lấy danh sách tòa nhà
        mav.addObject("buildingList", reqontList);
//        lấy hết tất cả các nhân viên ra
        mav.addObject("listStaffs", userService.getStaffs());
//        lấy danh sách các quận
        mav.addObject("districts", districtCode.type());
//        Loại tòa nhà
        mav.addObject("typeCodes", buildingType.type());

        return mav;
    }

//    view của thêm tòa nhà
    @RequestMapping(value = "/admin/building-edit" ,method = RequestMethod.GET)
    public ModelAndView buildingEdit(@ModelAttribute BuildingDTO buildingDTO, HttpServletRequest request) {
        ModelAndView mav=new ModelAndView("admin/building/edit");
        mav.addObject("buildingEdit", buildingDTO);

        mav.addObject("districts", districtCode.type());
        mav.addObject("typeCodes", buildingType.type());

        return mav;
    }

//    view của sửa tòa nhà voi id
    @RequestMapping(value = "/admin/building-edit-{id}" ,method = RequestMethod.GET)
    public ModelAndView buildingEdit(@PathVariable ("id") Long Id, HttpServletRequest request) {
        ModelAndView mav=new ModelAndView("admin/building/edit");
        BuildingDTO buildingDTO=new BuildingDTO();
        buildingDTO.setId(Id);
        buildingDTO.setName("Building");
        buildingDTO.setAddress("tan chau tay ninh");
        buildingDTO.setNumberOfBasement(2L);
        buildingDTO.setLevel(5l);
        mav.addObject("buildingEdit", buildingDTO);
//        xuống db tìm building theo id
        mav.addObject("districts", districtCode.type());
        mav.addObject("typeCodes", buildingType.type());
        return mav;
    }

}
