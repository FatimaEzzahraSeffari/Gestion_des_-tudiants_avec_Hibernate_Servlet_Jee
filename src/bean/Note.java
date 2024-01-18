package bean;


public class Note {

    private int noteId;

    private String content;

    private String author;


    // Constructors

    public Note() {

        

    }


    public Note(int noteId, String content, String author) {

        this.noteId = noteId;

        this.content = content;

        this.author = author;

    }


    // Getter and Setter methods

    public int getNoteId() {

        return noteId;

    }


    public void setNoteId(int noteId) {

        this.noteId = noteId;

    }


    public String getContent() {

        return content;

    }


    public void setContent(String content) {

        this.content = content;

    }


    public String getAuthor() {

        return author;

    }


    public void setAuthor(String author) {

        this.author = author;

    }


}