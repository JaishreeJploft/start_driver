import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MedicalRecordController extends GetxController {
  final useCanteenServicesPos = 1.obs;
  var yesNoList = ['Yes', 'No'];
  final allergicSelectedPos = 1.obs;
  final allergyFoodList = [
    'Crustacean Shellfish',
    'Egg',
    'Fish',
    'Milk',
    'Peanut',
    'Soy',
    'Tree Nuts',
    'Wheat',
    'Cereals w/ Gluten',
    'Sulfites',
    'Buckwheat',
    'Celery',
    'Lupin',
    'Molluscan Shellfish',
    'Mustard',
    'Sesame',
    'Bee Pollen/ Propolis',
    'Beef',
    'Chicken',
    'Latex (Natural Rubber)',
    'Mango',
    'Peach',
    'Pork',
    'Royal Jelly',
    'Tomato'
  ];
  final selectedAllergicFoodList = <String>[].obs;

  var infectiousDiseaseList = [
    'Diphtheria',
    'Dysentery',
    'Infective Hepatitis',
    'Measles',
    'Mumps',
    'Poliomyelitis',
    'Rubella',
    'Scarlet Fever',
    'Tuberculosis',
    'Whooping Cough',
    'Chicken Pox',
  ];


  final infectiousDiseaseList2 = [
    {
      'title' : 'Diphtheria',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Dysentery',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Infective Hepatitis',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Measles',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Mumps',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Poliomyelitis',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Rubella',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Scarlet Fever',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Tuberculosis',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Whooping Cough',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Chicken Pox',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
  ].obs;



  final diseaseConditionList2 = [
    {
      'title' : 'Accidents',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Allergies',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Bronchial Asthma',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Congenital heart Disease',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Diabetes mellitus',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Epilepsy',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'G6PD',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Rheumatic Fever',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Surgical Operation',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Thalassemia',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Others',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
  ].obs;


  // var diseaseConditionList = [
  //   'Accidents',
  //   'Allergies',
  //   'Bronchial Asthma',
  //   'Congenital heart Disease',
  //   'Diabetes mellitus',
  //   'Epilepsy',
  //   'G6PD',
  //   'Rheumatic Fever',
  //   'Surgical Operation',
  //   'Thalassemia',
  //   'Others',
  // ];








  final bloodTransfusionValue = 'Yes'.obs;
  final hospitalizationValue = 'Yes'.obs;

  var currentlyUsingList = [
    'Braces',
    'Crutches',
    'Eyeglass/Contact lenses',
  ];

  final selectedCurrentlyUsingList = <String>[].obs;

  TextEditingController? familyHistoryController;

  var medicalExaminationConsent =
      'According to the Health Authority Regulations, all staff members are required to undergo a medical examination.\n\nThe examination is carried out by the school doctor and includes measurement of height and weight, screening of vision and examination of ears, throat, heart, lungs and abdomen.\n\nIf you prefer to be examined by a doctor of your choice, you may do so at your convenience. The school requires a copy of the medical report to keep on your school health file.\n\nPlease tick below and we will contact you when you’re scheduled for examination.';
  final isConsentChecked = true.obs;
  final isMedicationPolicyChecked = true.obs;
  final isSicknessPolicyChecked = true.obs;
  var medicationPolicy =
      'Medication prescribed by your doctor that needs to be given during the school day should be administered by the school nurse. You are required to hand in the medication with the written prescription from the doctor and sign a specific consent form available at the clinic. If you have asthma, allergies or other conditions requiring the use of inhalers, nebulizers, Epipen or other medication we require such medication to be kept in the clinic in order to be given in an emergency situation.';
  final allergicMedicationSelectedPos = 0.obs;
  var sicknessPolicy =
      'If a staff member has a fever, diarrhea or vomiting, they are not allowed to attend school and may only return after 24 to 48 hours from the last episode of diarrhea, vomiting, fever or fever-reducing medication. If they develop the above symptoms while in school, they are required to leave the school premises immediately. In cases of communicable and infectious diseases or conditions, the school clinic should be notified as per Health Authority Regulation and a medical certificate that the staff member is fit to be in school has to be provided.';

  TextEditingController? allergicMedicineController;


  TextEditingController? commentController;
  final List<String> dates = ['July 2 9:30am', 'July 3 9:30am', 'July 4 9:30am'];
  final List<String> heading = [
    'Submit',
    'Review',
    'Approved'
  ];
  int curStep = 4; // 2 is kept minimum
  final showFab = false.obs;

  final selectedRadio = 0.obs;

  setSelectedRadio(int val) {
      selectedRadio.value = val;
  }

  TextEditingController? medicalFileTitleController;
  TextEditingController? medicalFileDescriptionController;

  MedicalRecordController() {
    familyHistoryController =
        TextEditingController(text: 'My grandfather has diabetes');
    allergicMedicineController = TextEditingController();

    medicalFileTitleController = TextEditingController();
    medicalFileDescriptionController = TextEditingController();

  }
}
