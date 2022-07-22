package com.example.hugo.dto;

import com.example.hugo.util.Pagination;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class HotSpotDTO extends Pagination {
    private Integer hotspot_idx;                 
    private String hotspot_name;               
    private String hotspot_tel;                
    private String hotspot_addr;               
    private String hotspot_operating_time;     
    private String hotspot_fee;                
    private String hotspot_menu;               
    private String hotspot_tag;                
    private Integer hotspot_star_score;         
    private Integer hotspot_popular_number;     
    private Integer hotspot_review_count;       
    private Integer hotspot_jjim;               
    private String hotspot_updateDate;         
    private String hotspot_updateUser;         
    private String hotspot_regDate;            
    private String hotspot_regUser;              
    private String hotspot_fileId;             
    private String hotspot_cd;
}
