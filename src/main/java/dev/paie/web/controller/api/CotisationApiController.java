package dev.paie.web.controller.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import dev.paie.entite.Cotisation;
import dev.paie.repository.CotisationRepository;

@RestController
@RequestMapping("/api/cotisations")
public class CotisationApiController {

	@Autowired
	CotisationRepository cotisationRepo;

	@RequestMapping(method = RequestMethod.GET)
	public List<Cotisation> trouverToutesLesCotisations() {
		return cotisationRepo.findAll();
	}

	@RequestMapping(method = RequestMethod.GET, path = "/{code}")
	public ResponseEntity trouverUneCotisationByCode(@PathVariable String code) {
		Cotisation cotis = cotisationRepo.findByCode(code);
		if (cotis == null) {
			Map<String, String> error = new HashMap<>();
			error.put("messgae", "la cotisation n'est pas reference");
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(error);
		} else {
			return ResponseEntity.ok().body(cotisationRepo.findByCode(code));

		}
	}

	@RequestMapping(method = RequestMethod.POST)
	public void inserCotisation(@RequestBody Cotisation cotisation) {
		cotisationRepo.save(cotisation);
	}

	@RequestMapping(method = RequestMethod.PUT, path = "/{code}")
	public void modifierCotisation(@PathVariable String code, @RequestBody Cotisation cotisation) {
		int id = cotisationRepo.findByCode(code).getId();
		cotisation.setId(id);
		this.cotisationRepo.save(cotisation);
	}

	@RequestMapping(method = RequestMethod.DELETE, path = "/{code}")
	public void deleteUneCotisationByCode(@PathVariable String code) {
		int id = cotisationRepo.findByCode(code).getId();
		cotisationRepo.delete(id);
	}
}
