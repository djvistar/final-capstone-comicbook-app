package com.techelevator.controller;

import java.net.http.HttpHeaders;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.techelevator.model.Volume;



@RestController
public class ComicVineAPIController {
	
//	@RequestMapping("/addVolume/{volumeTitle}")
//	public List<Volume> getVolume(@PathVariable String volumeTitle, HttpServletRequest request) {
//		
//		String apiURL = "https://comicvine.gamespot.com/api/";
//		String volumes = "volumes/?";
//		String keyValue = "a8be2fbe34bdee38d016c400c675139289302d9d";
//		String getVolumes = apiURL + volumes + "api_key=" + keyValue + "&format=json&filter=name:" + volumeTitle;
//		
//		HttpHeaders httpHeaders = new HttpHeaders();
//		httpHeaders.add("user-agent", "Mozilla/5.0 Firefox/26.0");
//		
//		HttpEntity<String> httpEntity = new HttpEntity<>(httpHeaders);
//		RestTemplate restTemplate = new RestTemplate();
//		ObjectMapper objectMapper = new ObjectMapper();
//		
//		ResponseEntity<String> response = restTemplate.exchange(getVolumes, HttpMethod.GET, httpEntity, String.class);
//		
//		
//		JsonNode jsonNode = objectMapper.readTree(response.getBody());
//		List <Volume> volumeList = new ArrayList<Volume>();
//		
//		
//		
//		
//		
//		return volumeList;
//		
//		
//	}

}
