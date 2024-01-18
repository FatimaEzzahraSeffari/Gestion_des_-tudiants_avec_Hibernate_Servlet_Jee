package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import bean.Etudiant;

public class EtudiantDAO {
    private static final SessionFactory sessionFactory;

    static {
        try {
            Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
            sessionFactory = configuration.buildSessionFactory();
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    public void addEtudiantDetails(String nom, String password, String email, String tel, String ecole) {
        try (Session session = sessionFactory.openSession()) {
            Etudiant  etudiant = new Etudiant();
            etudiant.setNom(nom);
            etudiant.setPassword1(password);
            etudiant.setEmail(email);
            etudiant.setTel(tel);
            etudiant.setEcole(ecole);

            session.save(etudiant);
            System.out.println("\n\n Details Added \n");
        } catch (HibernateException e) {
            System.err.println("Error adding etudiant details: " + e.getMessage());
        }
    }

    public List<Etudiant> getAllEtudiants() {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM Etudiant";
            return session.createQuery(hql, Etudiant.class).getResultList();
        } catch (HibernateException e) {
            System.err.println("Error retrieving etudiant list: " + e.getMessage());
            return null;
        }
    }
    public Etudiant getEtudiantById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Etudiant.class, id);
        } catch (HibernateException e) {
            System.err.println("Error retrieving étudiant by ID: " + e.getMessage());
            return null;
        }
    }

    public void deleteEtudiantById(int id) {
        try (Session session = sessionFactory.openSession()) {
            Etudiant etudiant = session.get(Etudiant.class, id);
            if (etudiant != null) {
                session.beginTransaction();
                session.delete(etudiant);
                session.getTransaction().commit();
                System.out.println("\n\n Étudiant Deleted \n");
            }
        } catch (HibernateException e) {
            System.err.println("Error deleting étudiant by ID: " + e.getMessage());
        }
    }

    public void updateEtudiantDetails(Etudiant etudiant) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.update(etudiant);
            session.getTransaction().commit();
            System.out.println("\n\n Étudiant Details Updated \n");
        } catch (HibernateException e) {
            System.err.println("Error updating étudiant details: " + e.getMessage());
        }
    }
}
