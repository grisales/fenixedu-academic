package net.sourceforge.fenixedu.domain.time;

import java.util.HashMap;
import java.util.Map;

import net.sourceforge.fenixedu.domain.time.chronologies.durationFields.AcademicSemestersDurationFieldType;
import net.sourceforge.fenixedu.domain.time.chronologies.durationFields.AcademicYearsDurationFieldType;

import org.joda.time.DurationFieldType;
import org.joda.time.PeriodType;

public class AcademicPeriodType extends PeriodType {

    private static int ACADEMIC_YEAR_INDEX = 8;
    private static int ACADEMIC_SEMESTER_INDEX = 9;
    private static int ACADEMIC_TRIMESTER_INDEX = 10;

    private static Map<String, AcademicPeriodType> academicPeriods = new HashMap<String, AcademicPeriodType>();

    private static AcademicPeriodType academicYears = new AcademicPeriodType("AcademicYear",
            AcademicYearsDurationFieldType.academicYears(), new int[] { -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1 });
    private static AcademicPeriodType academicSemesters = new AcademicPeriodType("AcademicSemester",
            AcademicSemestersDurationFieldType.academicSemesters(), new int[] { -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1 });
    private static AcademicPeriodType academicTrimesters = new AcademicPeriodType("AcademicTrimester",
            AcademicSemestersDurationFieldType.academicSemesters(), new int[] { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0 });

    static {
        academicPeriods.put(academicYears.getName(), academicYears);
        academicPeriods.put(academicSemesters.getName(), academicSemesters);
        academicPeriods.put(academicTrimesters.getName(), academicTrimesters);
    }

    protected AcademicPeriodType(String name, DurationFieldType type, int[] indices) {
        super(name, new DurationFieldType[] { type }, indices);
    }

    public static AcademicPeriodType academicYears() {
        return academicYears;
    }

    public static AcademicPeriodType academicSemesters() {
        return academicSemesters;
    }

    public static AcademicPeriodType academicTrimesters() {
        return academicTrimesters;
    }

    public static AcademicPeriodType getAcademicPerdiodByName(final String name) {
        return academicPeriods.get(name);
    }

}