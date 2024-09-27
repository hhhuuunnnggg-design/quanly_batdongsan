package com.javaweb.service.impl;


import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BuildingServiceIpml implements BuildingService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;

    @Override
    public ResponseDTO listStaffs(Long buildingId) {
//        tìm tòa nhà
        BuildingEntity building = buildingRepository.findById(buildingId).orElseThrow(() -> new RuntimeException("Building not found"));
//        danh sách tất cả nhân viên
        List<UserEntity> staffs=userRepository.findByStatusAndRoles_Code(1,"STAFF");
//        danh sách nhan viên đang quản lý toàn nhà
        List<UserEntity> staffAssiment=building.getUserEntities();
        ResponseDTO responseDTO = new ResponseDTO();

        List<StaffResponseDTO> StaffResponseDTOS=new ArrayList<>();
        for (UserEntity it : staffs) {
            StaffResponseDTO staffResponseDTO=new StaffResponseDTO();
            staffResponseDTO.setStaffId(it.getId());
            staffResponseDTO.setFullName(it.getFullName());
            if(staffAssiment.contains(it)){
                staffResponseDTO.setChecked("checked");
            }
            else {
                staffResponseDTO.setChecked("");
            }
            StaffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(StaffResponseDTOS);
        responseDTO.setMessage("Thành công");
        return responseDTO;
    }
}
