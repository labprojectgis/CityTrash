package es.udc.citytrash.controller.util.anotaciones;

import static java.lang.annotation.ElementType.*;
import static java.lang.annotation.RetentionPolicy.*;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;

/**
 * Validar que la nombre del camion no exista
 */
@Target({ METHOD, FIELD })
@Retention(RUNTIME)
@Constraint(validatedBy = es.udc.citytrash.controller.util.validadores.CamionNombreUnicoImpl.class)
@Documented
public @interface CamionNombreUnico {

	String message() default "{validador.nombre.existente}";

	Class<?>[] groups() default {};

	Class<? extends Payload>[] payload() default {};
}
