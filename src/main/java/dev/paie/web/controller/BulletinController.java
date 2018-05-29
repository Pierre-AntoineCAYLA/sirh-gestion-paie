package dev.paie.web.controller;

import java.time.ZonedDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.paie.entite.BulletinSalaire;
import dev.paie.entite.Periode;
import dev.paie.entite.RemunerationEmploye;
import dev.paie.repository.BulletinSalaireRepository;
import dev.paie.repository.PeriodeRepository;
import dev.paie.repository.RemunerationEmployeRepository;
import dev.paie.service.CalculerRemunerationService;

@Controller
@RequestMapping("/bulletin")
public class BulletinController {

	@Autowired
	private RemunerationEmployeRepository remunerationEmployeRepository;
	@Autowired
	private PeriodeRepository periodeRepository;
	@Autowired
	private BulletinSalaireRepository bulletinSalaireRepository;
	@Autowired
	private CalculerRemunerationService calculerRemunerationService;

	@RequestMapping(method = RequestMethod.GET, path = "/creer")
	public ModelAndView creerBulletin(Model model) {

		BulletinSalaire bulletin = new BulletinSalaire();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("bulletin/creerBulletin");

		model.addAttribute("bulletin", bulletin);

		List<Periode> lp = periodeRepository.findAll();
		List<RemunerationEmploye> lm = remunerationEmployeRepository.findAll();

		mv.addObject("periode", lp);
		mv.addObject("matricule", lm);

		return mv;
	}

	@RequestMapping(method = RequestMethod.POST, path = "/creer")
	public String submitForm(@ModelAttribute("bulletin") BulletinSalaire bulletin) {
		bulletin.setDate(ZonedDateTime.now());
		bulletinSalaireRepository.save(bulletin);
		return "redirect:/mvc/bulletin/lister";
	}

	@RequestMapping(method = RequestMethod.GET, path = "/lister")
	public ModelAndView listerBulletin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("bulletin/listerBulletin");
		mv.addObject("bulletin", calculerRemunerationService.resultat());
		return mv;
	}

	@RequestMapping(value = "/lister/{id}", method = RequestMethod.GET)
	public ModelAndView afficherBulletin(@PathVariable int id) {
		BulletinSalaire bulletin = bulletinSalaireRepository.findOne(id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("bulletin/Bulletin");
		mv.addObject("bulletin", bulletin);
		return mv;
	}
}