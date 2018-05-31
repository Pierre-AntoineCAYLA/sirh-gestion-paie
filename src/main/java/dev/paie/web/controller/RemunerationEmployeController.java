package dev.paie.web.controller;

import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import dev.paie.entite.Collegues;
import dev.paie.entite.Entreprise;
import dev.paie.entite.Grade;
import dev.paie.entite.ProfilRemuneration;
import dev.paie.entite.RemunerationEmploye;
import dev.paie.repository.EntrepriseRepository;
import dev.paie.repository.GradeRepository;
import dev.paie.repository.ProfilRemunerationRepository;
import dev.paie.repository.RemunerationEmployeRepository;

@Controller
@RequestMapping("/employes")
public class RemunerationEmployeController {

	@Autowired
	private GradeRepository gradeReprository;
	@Autowired
	private EntrepriseRepository entrepriseRepository;
	@Autowired
	private ProfilRemunerationRepository profilRepository;
	@Autowired
	private RemunerationEmployeRepository remunerationRepository;

	@RequestMapping(method = RequestMethod.GET, path = "/creer")
	@Secured("ROLE_ADMINISTRATEUR")
	public ModelAndView creerEmploye() {

		RemunerationEmploye remunerationEmploye = new RemunerationEmploye();

		ModelAndView mv = new ModelAndView();
		mv.setViewName("employes/creerEmploye");

		RestTemplate rt = new RestTemplate();
		Collegues[] collegues = rt.getForObject("http://collegues-api.cleverapps.io/collegues", Collegues[].class);

		List<String> matricules = new ArrayList<>();
		List<Grade> lg = gradeReprository.findAll();
		List<Entreprise> le = entrepriseRepository.findAll();
		List<ProfilRemuneration> lp = profilRepository.findAll();
		for (Collegues collegue : collegues) {
			matricules.add(collegue.getMatricule());
		}

		mv.addObject("matricule", matricules);
		mv.addObject("grade", lg);
		mv.addObject("entreprise", le);
		mv.addObject("profil", lp);
		mv.addObject("RemunerationEmploye", remunerationEmploye);

		return mv;
	}

	@RequestMapping(method = RequestMethod.POST, path = "/creer")
	@Secured("ROLE_ADMINISTRATEUR")
	public String submitForm(@ModelAttribute("remunerationEmploye") RemunerationEmploye rem) {
		rem.setDate(ZonedDateTime.now());
		remunerationRepository.save(rem);
		return "redirect:/mvc/employes/lister";
	}

	@RequestMapping(method = RequestMethod.GET, path = "/lister")
	@Secured({ "ROLE_UTILISATEUR", "ROLE_ADMINISTRATEUR" })
	public ModelAndView listerEmploye() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("employes/listerEmploye");
		mv.addObject("remunerationEmploye", remunerationRepository.findAll());
		return mv;
	}

}