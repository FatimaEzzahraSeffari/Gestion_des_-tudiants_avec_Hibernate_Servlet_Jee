package dao;


import java.util.List;


import org.hibernate.HibernateException;

import org.hibernate.Session;

import org.hibernate.SessionFactory;

import org.hibernate.cfg.Configuration;


import bean.Note;


public class NoteDAO {

    private static final SessionFactory sessionFactory;


    static {

        try {

            Configuration configuration = new Configuration().configure("hibernate.cfg.xml");

            sessionFactory = configuration.buildSessionFactory();

        } catch (Throwable ex) {

            throw new ExceptionInInitializerError(ex);

        }

    }


    public void addNoteDetails(String content, String author) {

        try (Session session = sessionFactory.openSession()) {

            Note note = new Note();

            note.setContent(content);

            note.setAuthor(author);


            session.save(note);

            System.out.println("\n\n Note Details Added \n");

        } catch (HibernateException e) {

            System.err.println("Error adding note details: " + e.getMessage());

        }

    }


    public List<Note> getAllNotes() {

        try (Session session = sessionFactory.openSession()) {

            String hql = "FROM Note";

            return session.createQuery(hql, Note.class).getResultList();

        } catch (HibernateException e) {

            System.err.println("Error retrieving note list: " + e.getMessage());

            return null;

        }

    }
    public Note getNoteById(int noteId) {

        try (Session session = sessionFactory.openSession()) {

            return session.get(Note.class, noteId);

        } catch (HibernateException e) {

            System.err.println("Error retrieving note by ID: " + e.getMessage());

            return null;

        }

    }


    public void deleteNoteById(int noteId) {

        try (Session session = sessionFactory.openSession()) {

            Note note = session.get(Note.class, noteId);

            if (note != null) {

                session.beginTransaction();

                session.delete(note);

                session.getTransaction().commit();

                System.out.println("\n\n Note Deleted \n");

            }

        } catch (HibernateException e) {

            System.err.println("Error deleting note by ID: " + e.getMessage());

        }

    }

    public void updateNoteDetails(Note note) {

        try (Session session = sessionFactory.openSession()) {

            session.beginTransaction();

            session.update(note);

            session.getTransaction().commit();

            System.out.println("\n\n Note Details Updated \n");

        } catch (HibernateException e) {

            System.err.println("Error updating note details: " + e.getMessage());

        }

    }

}