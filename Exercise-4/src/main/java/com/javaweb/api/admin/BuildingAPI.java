package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.BuildingService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "buildingAPIOfadmin")
@RequestMapping("/api/building")
public class BuildingAPI {
    private static final Logger log = LoggerFactory.getLogger(BuildingAPI.class);
    @Autowired
    private BuildingService buildingService;

    //update
    @PostMapping
    public BuildingDTO btnAddOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO) {
        // xuong db de update
        return buildingDTO;
    }

//    Delete
    @DeleteMapping("/{ids}")
    public void deleteBuilDing(@PathVariable List<Long>ids) {
        //xuống db để xóa building theo danh sách gưỉ về
        System.out.println("đã xóa thành công"+ids);

    }
    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        ResponseDTO result=buildingService.listStaffs(id);
        return result;
    }
//    @PostMapping("/assigment")
//    public void updateAssigmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
//        System.out.println("ok");
//
//    }
}
