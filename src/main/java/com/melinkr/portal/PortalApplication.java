package com.melinkr.portal;

import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.HttpMessageConverters;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;


/**
 * Created by <a href="mailto:xiegengcai@gmail.com">Xie Gengcai</a> on 2016/10/8.
 */
@Configuration
@ComponentScan(basePackages="com.melinkr.portal.controller")
@ImportResource({"classpath*:spring/spring.xml", /*"classpath*:spring/spring-dubbo.xml",*/ "classpath*:spring/mvc-view-controller.xml"})
@SpringBootApplication
public class PortalApplication extends SpringBootServletInitializer {

    @Bean
    public HttpMessageConverters fastJsonHttpMessageConverters() {
        FastJsonHttpMessageConverter fastConverter = new FastJsonHttpMessageConverter();
        FastJsonConfig fastJsonConfig = new FastJsonConfig();
        fastJsonConfig.setSerializerFeatures(
                SerializerFeature.PrettyFormat
//                , SerializerFeature.WriteMapNullValue //设置null值也要输出，fastjson默认是关闭的
                , SerializerFeature.QuoteFieldNames
                , SerializerFeature.WriteDateUseDateFormat
                , SerializerFeature.WriteNullBooleanAsFalse
                , SerializerFeature.WriteNullListAsEmpty
//                , SerializerFeature.WriteMapNullValue
        );
        fastConverter.setFastJsonConfig(fastJsonConfig);
        HttpMessageConverter<?> converter = fastConverter;
        return new HttpMessageConverters(converter);
    }

/*

    @Bean
    public EmbeddedServletContainerCustomizer containerCustomizer() {
        return container -> {
            container.addErrorPages(new ErrorPage(HttpStatus.BAD_REQUEST, "/400"));
            container.addErrorPages(new ErrorPage(HttpStatus.UNAUTHORIZED, "/401"));
            container.addErrorPages(new ErrorPage(HttpStatus.FORBIDDEN, "/403"));
            container.addErrorPages(new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/500"));
            container.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, "/404"));
        };
    }
*/

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(PortalApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(PortalApplication.class, args);
    }
}
