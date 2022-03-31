package org.moym.controller;



import org.moym.domain.Criteria;
import org.moym.domain.RereplyPageDTO;
import org.moym.domain.RereplyVO;
import org.moym.service.StorageRereplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@RequestMapping("/storageRereplies/")
@RestController
@Log4j
@AllArgsConstructor
public class StorageRereplyController {
	
	
	private StorageRereplyService rereplyService;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/new", 
			consumes = "application/json", 
			produces = { MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody RereplyVO vo){
		
		log.info("RereplyVO : " + vo);
		
		int insertCount = rereplyService.register(vo);
		
		log.info("Rereply INSERT COUNT: " + insertCount);
		
		return insertCount == 1
				? new ResponseEntity<>("sucess", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/pages/{rno}/{page}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<RereplyPageDTO> getList(
			@PathVariable("page") int page,
			@PathVariable("rno") Long rno){
		
		Criteria cri = new Criteria(page,10);
		
		log.info("get Ready List rno : " + rno);

		
		log.info("cri:" + cri);
		
		return new ResponseEntity<>(rereplyService.getListPage(cri, rno),HttpStatus.OK);
	}
	
	
	@GetMapping(value = "/{rrno}",
			produces = { MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<RereplyVO> get(@PathVariable("rrno") Long rrno){	//To read reply when you click a reply
		
		log.info("get: " + rrno);
		
		return new ResponseEntity<>(rereplyService.get(rrno), HttpStatus.OK);
		
	}
	
	
	@PreAuthorize("principal.username == #vo.rereplyer")
	@DeleteMapping("/{rrno}")
	public ResponseEntity<String> remove(@RequestBody RereplyVO vo, @PathVariable("rrno") Long rrno){
		log.info("remove : " + rrno);
		
		log.info("replyer: " + vo.getRereplyer());
		
		return rereplyService.remove(rrno) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	
	
	@PreAuthorize("principal.username == #vo.rereplyer")
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{rrno}",
			consumes = "application/json")
	public ResponseEntity<String> modify(
			@RequestBody RereplyVO vo,
			@PathVariable("rrno") Long rrno) {
		
		
		log.info("rrno : " + rrno);
		log.info("modify : " + vo);
		
		return rereplyService.modify(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
