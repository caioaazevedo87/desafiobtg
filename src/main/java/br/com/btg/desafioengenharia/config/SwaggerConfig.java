package br.com.btg.desafioengenharia.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.spring.web.plugins.WebMvcRequestHandlerProvider;
import springfox.documentation.spring.web.readers.operation.HandlerMethodResolver;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import javax.servlet.ServletContext;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static springfox.documentation.builders.RequestHandlerSelectors.basePackage;

@Configuration
@EnableSwagger2
public class SwaggerConfig {

    @Bean
    public Docket api() {
        return new Docket(DocumentationType.SWAGGER_2)
                .select()
                .apis(basePackage(("br.com.btg.desafioengenharia.controller")))
                .build()
                .apiInfo(getApiInfo())
                .useDefaultResponseMessages(false)
                .consumes(Collections.singleton(MediaType.APPLICATION_JSON_VALUE))
                .produces(Collections.singleton(MediaType.APPLICATION_JSON_VALUE));
    }

    @Bean
    public WebMvcRequestHandlerProvider webMvcRequestHandlerProvider(Optional<ServletContext> servletContext, HandlerMethodResolver methodResolver, List<RequestMappingInfoHandlerMapping> handlerMappings) {
        handlerMappings = handlerMappings.stream().filter(rh -> rh.getClass().getName().contains("RequestMapping")).collect(Collectors.toList());
        return new WebMvcRequestHandlerProvider(servletContext, methodResolver, handlerMappings);
    }

    private ApiInfo getApiInfo() {
        return new ApiInfoBuilder()
                .title("Desafio Engenharia BTG")
                .description("Candidato: Caio Abreu de Azevedo")
                .version("1.0.0")
                .build();
    }

}
