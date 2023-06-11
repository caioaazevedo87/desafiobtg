package br.com.btg.desafioengenharia.config;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.runner.ApplicationContextRunner;

class SwaggerConfigTest {

  ApplicationContextRunner context = new ApplicationContextRunner()
      .withUserConfiguration(SwaggerConfig.class);

  @Test
  void should_check_presence_of_example_service() {
    context.run(it -> {
      assertThat(it).hasSingleBean(SwaggerConfig.class);
    });
  }
}
