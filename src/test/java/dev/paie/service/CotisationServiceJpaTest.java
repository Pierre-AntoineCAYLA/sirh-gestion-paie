package dev.paie.service;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.junit.Assert.assertThat;

import java.math.BigDecimal;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import dev.paie.config.H2Config;
import dev.paie.config.JpaConfig;
import dev.paie.entite.Cotisation;
import dev.paie.util.PaieUtils;

@ContextConfiguration(classes = { H2Config.class, JpaConfig.class, PaieUtils.class, CotisationServiceJpa.class })
@RunWith(SpringRunner.class)
public class CotisationServiceJpaTest {

	@Autowired
	private CotisationService cotisationService;

	@Test
	public void test_sauvegarder_lister_mettre_a_jour() {
		BigDecimal ts = new BigDecimal("137");
		BigDecimal tp = new BigDecimal("167");
		Cotisation cotis = new Cotisation(null, "code1", "cotis1", ts, tp);

		cotisationService.sauvegarder(cotis);
		List<Cotisation> listeCotisation = cotisationService.lister();
		assertThat(listeCotisation.get(0).getId(), equalTo(1));
		assertThat(listeCotisation.get(0).getCode(), equalTo("code1"));
		assertThat(listeCotisation.get(0).getLibelle(), equalTo("cotis1"));
		assertThat(listeCotisation.get(0).getTauxSalarial(), equalTo(new BigDecimal("137.00")));
		assertThat(listeCotisation.get(0).getTauxPatronal(), equalTo(new BigDecimal("167.00")));

		cotis.setCode("code111");
		cotisationService.mettreAJour(cotis);
		listeCotisation = cotisationService.lister();
		assertThat(listeCotisation.get(0).getCode(), equalTo("code111"));
	}
}
