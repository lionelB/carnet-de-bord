from datetime import date

from api.db.crud.beneficiary import get_beneficiary_from_personal_information
from api.db.crud.wanted_job import find_wanted_job_for_beneficiary
from api.db.models.beneficiary import Beneficiary, BeneficiaryImport
from cdb_csv import pe
from cdb_csv.models.csv_row import PrincipalCsvRow


async def test_get_beneficiary_with_wanted_jobs(pe_principal_csv_series, db_connection):

    # Get the first row
    _, series = next(pe_principal_csv_series.iterrows())
    csv_row: PrincipalCsvRow = await pe.map_principal_row(series)

    beneficiary: Beneficiary | None = await get_beneficiary_from_personal_information(
        db_connection,
        firstname=csv_row.prenom,
        lastname=csv_row.nom,
        birth_date=csv_row.date_naissance,
    )

    assert beneficiary is not None

    if beneficiary:
        assert beneficiary.lastname == "Tifour"
        assert beneficiary.firstname == "Sophie"
        assert beneficiary.date_of_birth == date(1982, 2, 1)
        assert beneficiary.notebook is not None
        assert len(beneficiary.notebook.wanted_jobs) == 2

        assert (
            await find_wanted_job_for_beneficiary(
                beneficiary, csv_row.rome_1, csv_row.appelation_rome_1
            )
        ) is not None


async def test_get_beneficiary_without_wanted_jobs(
    pe_principal_csv_series, db_connection
):

    for idx, series in pe_principal_csv_series.iterrows():
        # Get the second element
        if idx == 1:

            csv_row: PrincipalCsvRow = await pe.map_principal_row(series)

            beneficiary: Beneficiary | None = (
                await get_beneficiary_from_personal_information(
                    db_connection,
                    firstname=csv_row.prenom,
                    lastname=csv_row.nom,
                    birth_date=csv_row.date_naissance,
                )
            )

            assert beneficiary is not None

            if beneficiary:
                assert beneficiary.lastname == "Dorsey"
                assert beneficiary.firstname == "Hendrix"
                assert beneficiary.date_of_birth == date(1976, 12, 18)
                assert beneficiary.notebook is not None
                assert len(beneficiary.notebook.wanted_jobs) == 0

                assert (
                    await find_wanted_job_for_beneficiary(
                        beneficiary, csv_row.rome_1, csv_row.appelation_rome_1
                    )
                ) is None


async def test_get_beneficiary_without_notebook(pe_principal_csv_series, db_connection):

    for idx, series in pe_principal_csv_series.iterrows():
        # Get the third element
        if idx == 2:

            csv_row: PrincipalCsvRow = await pe.map_principal_row(series)

            beneficiary: Beneficiary | None = (
                await get_beneficiary_from_personal_information(
                    db_connection,
                    firstname=csv_row.prenom,
                    lastname=csv_row.nom,
                    birth_date=csv_row.date_naissance,
                )
            )

            assert beneficiary is not None

            if beneficiary:
                assert beneficiary.notebook is None


async def test_get_beneficiary_with_unknown_rome_code(
    caplog, pe_principal_csv_series, db_connection
):

    for idx, series in pe_principal_csv_series.iterrows():
        # Get the fourth element
        if idx == 3:

            csv_row: PrincipalCsvRow = await pe.map_principal_row(series)

            beneficiary: Beneficiary | None = (
                await get_beneficiary_from_personal_information(
                    db_connection,
                    firstname=csv_row.prenom,
                    lastname=csv_row.nom,
                    birth_date=csv_row.date_naissance,
                )
            )

            assert beneficiary is not None

            if beneficiary:
                assert beneficiary.lastname == "Skinner"
                assert beneficiary.firstname == "Edwina"
                assert beneficiary.date_of_birth == date(1973, 5, 14)
                assert beneficiary.notebook is not None
                assert len(beneficiary.notebook.wanted_jobs) == 0

                assert (
                    await find_wanted_job_for_beneficiary(
                        beneficiary, csv_row.rome_1, csv_row.appelation_rome_1
                    )
                ) is None

                await pe.check_and_insert_wanted_job(
                    db_connection,
                    beneficiary.notebook,
                    csv_row.rome_1,
                    csv_row.appelation_rome_1,
                )

                assert "Rome code not found" in caplog.text


def test_beneficiary_model_beneficiary_filled_keys(
    beneficiary_import_alain_die: BeneficiaryImport,
):
    editable_keys = beneficiary_import_alain_die.get_beneficiary_editable_keys()
    editable_keys.sort()
    assert editable_keys == [
        "address1",
        "address2",
        "city",
        "email",
        "mobile_number",
        "place_of_birth",
        "postal_code",
    ]


def test_beneficiary_model_notebook_filled_keys(
    beneficiary_import_alain_die: BeneficiaryImport,
):
    editable_keys = beneficiary_import_alain_die.get_notebook_editable_keys()
    editable_keys.sort()
    assert editable_keys == [
        "geographical_area",
        "right_ass",
        "right_rsa",
        "work_situation",
    ]


def test_beneficairy_get_values_for_keys(
    beneficiary_import_alain_die: BeneficiaryImport,
):
    beneficiary_import_alain_die.right_are = True
    beneficiary_import_alain_die.right_ass = True
    beneficiary_import_alain_die.right_bonus = True
    values = beneficiary_import_alain_die.get_values_for_keys(
        [
            "geographical_area",
            "right_are",
            "right_ass",
            "right_bonus",
            "right_rsa",
            "work_situation",
        ]
    )
    assert values == [
        "between_20_30",
        True,
        True,
        True,
        "rsa_droit_ouvert_versable",
        "iae",
    ]
