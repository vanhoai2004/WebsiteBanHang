package edu.poly.dto;


import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Productdto {
	private MultipartFile imgFile;
	private String imgUrl;
}
