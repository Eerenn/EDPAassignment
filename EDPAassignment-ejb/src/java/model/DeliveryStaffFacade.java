/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Iterator;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Ee ren
 */
@Stateless
public class DeliveryStaffFacade extends AbstractFacade<DeliveryStaff> {

    @PersistenceContext(unitName = "EDPAassignment-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DeliveryStaffFacade() {
        super(DeliveryStaff.class);
    }
    
    public int search(String str){
        Query q = em.createNamedQuery("DeliveryStaff.search");
        q.setParameter("x", str);
        List<DeliveryStaff> answer = null;
        List<DeliveryStaff> result = q.getResultList();
        for(Iterator it=result.listIterator();it.hasNext();){
            answer.add((DeliveryStaff)it.next());
        }
        return answer.size();
    }
    
}
