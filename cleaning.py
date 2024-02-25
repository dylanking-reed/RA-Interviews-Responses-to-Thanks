import csv

FIELDNAMES_ORIGINAL = [
    "Timestamp",
    "Your Name ",
    "Thanking Prompt",
    "Response",
    "Age Bin",
    "Location",
    "How familiar is the person to you?",
    "How distracted was the person (Section 2)",
]
FIELDNAMES_CLEANED = [
    "Timestamp",
    "Thanker",
    "Thanks Level",
    "Age Bin",
    "On Campus",
    "Familiarity",
    "Distractedness",
    "No problem",
    "You're welcome",
    "Acknowledgement",
    "Farewell",
    "Non-Verbal",
    "No Response",
]


def clean_age_bin(src: str) -> int:
    bins = {
        "Gen Z (18-27)": 20,
        "Millenial (28-43)": 35,
        "Gen X (44-59)": 50,
        "Boomer + (60 and up)": 65,
    }
    return bins[src]


def clean_thanks_level(src: str) -> int:
    thanks_levels = {
        "Thanks": 1,
        "Thank you": 2,
        "Thank you (very much)": 3,
    }
    return thanks_levels[src]


def clean_location(src: str) -> int:
    return {"On campus": 1, "Off campus": 0}[src]


def clean_interview(src: dict) -> dict:
    clean = {
        "Timestamp": src["Timestamp"],
        "Thanker": src["Your Name "],
        "Thanks Level": clean_thanks_level(src["Thanking Prompt"]),
        "Age Bin": clean_age_bin(src["Age Bin"]),
        "On Campus": clean_location(src["Location"]),
        "Familiarity": src["How familiar is the person to you?"],
        "Distractedness": src["How distracted was the person (Section 2)"],
        "No problem": int("No problem/no worries" in src["Response"]),
        "You're welcome": int("You're welcome" in src["Response"]),
        "Acknowledgement": int(
            "Acknowledgements (yeah, uh-huh, mm-hmm, you bet, okay)" in src["Response"]
        ),
        "Farewell": int(
            "Farewell statements (have a good day, bye)" in src["Response"]
        ),
        "Non-Verbal": int(
            "Non-verbal Response (smiling, nodding, thumbs up)" in src["Response"]
        ),
        "No Response": int("No Response" in src["Response"]),
    }
    return clean


with (
    open(
        "(Exported from Sheets) Responses to Thanks.csv", "r"
    ) as interviews_original_csv,
    open(
        "RA Interviews Responses to Thanks.csv", "w", newline=""
    ) as interviews_cleaned_csv,
):
    interviews_original = csv.DictReader(interviews_original_csv)
    interviews_cleaned = csv.DictWriter(
        interviews_cleaned_csv, fieldnames=FIELDNAMES_CLEANED
    )
    interviews_cleaned.writeheader()
    for interview in interviews_original:
        interviews_cleaned.writerow(clean_interview(interview))
