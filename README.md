# Basic Nested Forms Lab

## Objectives

1. Build out a form for creating a new doctor that accepts nested attributes for up to 3 patients.
2. Use fields_for to generate the association fields.
3. After creating the doctor, it should redirect to the doctor's show page.
4. The doctor show page should display the doctor's name, and lists all of the patients and their age that `belong_to` that doctor.

## Data Model: Doctor with patients

The data model we're going to be working with today is a doctor with patients.

  * Doctor
    * has many patients
    * name:string
  * Patient
    * belongs to a doctor
    * name:string
    * age:integer

The models and show routes and associations have been set up for you.

### Instructions

Build a doctor form that accepts three patients! It should automatically create the new `Patient` objects.
