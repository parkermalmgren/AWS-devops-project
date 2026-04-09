
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

notes = [
    {"id": 1, "content": "Learn FastAPI"},
    {"id": 2, "content": "Deploy EC2"},
    {"id": 3, "conetnt": "Learn Terraform"}
]

parker = [
    {"name": "Parker",
     "age": 21,
     "School": "University of Tampa"}
]

class Note(BaseModel):
    text: str

@app.get("/")
def read_root():
    return {"imran is dumb": "6 is not accepted btw"}

@app.get("/notes")
def read_notes():
    return notes

@app.post("/notes")
def create_note(note: Note):
    new_note = {"id": len(notes) +1, "content": note.text}
    notes.append(new_note)
    return new_note

