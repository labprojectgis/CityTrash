package es.udc.citytrash.model.tipoDeBasura;

import org.springframework.stereotype.Repository;

import es.udc.citytrash.model.util.genericdao.GenericHibernateDAOImpl;

@Repository("TipoDeBasuraDao")
public class TipoDeBasuraDaoHibernate extends GenericHibernateDAOImpl<TipoDeBasura, Integer>
		implements TipoDeBasuraDao {

}