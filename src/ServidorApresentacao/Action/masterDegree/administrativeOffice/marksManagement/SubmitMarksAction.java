package ServidorApresentacao.Action.masterDegree.administrativeOffice.marksManagement;

import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanComparator;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.validator.DynaValidatorForm;

import DataBeans.InfoSiteEnrolmentEvaluation;
import ServidorAplicacao.GestorServicos;
import ServidorAplicacao.IUserView;
import ServidorAplicacao.Servico.exceptions.ExistingServiceException;
import ServidorAplicacao.Servico.exceptions.FenixServiceException;
import ServidorAplicacao.Servico.exceptions.NonExistingServiceException;
import ServidorApresentacao.Action.exceptions.FenixActionException;
import ServidorApresentacao.Action.sop.utils.SessionConstants;

/**
 * 
 * @author Fernanda Quit�rio
 * 01/07/2003
 * 
 */
public class SubmitMarksAction extends DispatchAction {

	public ActionForward prepare(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		HttpSession session = request.getSession(false);

		String executionYear = getFromRequest("executionYear", request);
		String degree = getFromRequest("degree", request);
		String curricularCourse = getFromRequest("curricularCourse", request);
		Integer scopeCode = new Integer(getFromRequest("scopeCode", request));

		request.setAttribute("executionYear", executionYear);
		request.setAttribute("degree", degree);
		request.setAttribute("curricularCourse", curricularCourse);
		request.setAttribute("scopeCode", scopeCode);

		// Get students List			
		Object args[] = { scopeCode };
		IUserView userView = (IUserView) session.getAttribute(SessionConstants.U_VIEW);
		GestorServicos serviceManager = GestorServicos.manager();
		InfoSiteEnrolmentEvaluation infoSiteEnrolmentEvaluation = null;
		try {
			infoSiteEnrolmentEvaluation =
				(InfoSiteEnrolmentEvaluation) serviceManager.executar(userView, "ReadStudentsAndMarksByCurricularCourse", args);
		} catch (NonExistingServiceException e) {
			ActionErrors errors = new ActionErrors();
			errors.add("nonExisting", new ActionError("message.masterDegree.notfound.students"));
			saveErrors(request, errors);
			return mapping.getInputForward();

		} catch (ExistingServiceException e) {
			ActionErrors errors = new ActionErrors();
			errors.add("existing", new ActionError("message.masterDegree.evaluation.alreadyConfirmed"));
			saveErrors(request, errors);
			return mapping.getInputForward();

		} catch (FenixServiceException e) {
			throw new FenixActionException(e);
		}

		Collections.sort(
			infoSiteEnrolmentEvaluation.getEnrolmentEvaluations(),
			new BeanComparator("infoEnrolment.infoStudentCurricularPlan.infoStudent.number"));

		//		fill in teacher number in case it exists
		DynaValidatorForm submitMarksForm = (DynaValidatorForm) form;
		submitMarksForm.set("teacherNumber", infoSiteEnrolmentEvaluation.getInfoTeacher().getTeacherNumber());

		request.setAttribute("infoSiteEnrolmentEvaluation", infoSiteEnrolmentEvaluation);

		return mapping.findForward("MarksSubmission");

	}

	public ActionForward submit(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		HttpSession session = request.getSession(false);

		String executionYear = getFromRequest("executionYear", request);
		String degree = getFromRequest("degree", request);
		String curricularCourse = getFromRequest("curricularCourse", request);
		Integer scopeCode = new Integer(getFromRequest("scopeCode", request));

		request.setAttribute("executionYear", executionYear);
		request.setAttribute("degree", degree);
		request.setAttribute("curricularCourse", curricularCourse);
		request.setAttribute("scopeCode", scopeCode);
			/*
		Object args[] = { scopeCode };
		IUserView userView = (IUserView) session.getAttribute(SessionConstants.U_VIEW);
		GestorServicos serviceManager = GestorServicos.manager();
		InfoSiteEnrolmentEvaluation infoSiteEnrolmentEvaluation = null;
		try {
			infoSiteEnrolmentEvaluation =
				(InfoSiteEnrolmentEvaluation) serviceManager.executar(userView, "ReadStudentsAndMarksByCurricularCourse", args);
		} catch (NonExistingServiceException e) {
			ActionErrors errors = new ActionErrors();
			errors.add("nonExisting", new ActionError("message.masterDegree.notfound.students"));
			saveErrors(request, errors);
			return mapping.getInputForward();

		} catch (ExistingServiceException e) {
			ActionErrors errors = new ActionErrors();
			errors.add("existing", new ActionError("message.masterDegree.evaluation.alreadyConfirmed"));
			saveErrors(request, errors);
			return mapping.getInputForward();

		} catch (FenixServiceException e) {
			throw new FenixActionException(e);
		}

		Collections.sort(
			infoSiteEnrolmentEvaluation.getEnrolmentEvaluations(),
			new BeanComparator("infoEnrolment.infoStudentCurricularPlan.infoStudent.number"));

		//		fill in teacher number in case it exists
		DynaValidatorForm submitMarksForm = (DynaValidatorForm) form;
		submitMarksForm.set("teacherNumber", infoSiteEnrolmentEvaluation.getInfoTeacher().getTeacherNumber());

		request.setAttribute("infoSiteEnrolmentEvaluation", infoSiteEnrolmentEvaluation);
*/
		return mapping.findForward("ShowMarksManagementMenu");

	}
	private String getFromRequest(String parameter, HttpServletRequest request) {
		String parameterString = request.getParameter(parameter);
		if (parameterString == null) {
			parameterString = (String) request.getAttribute(parameter);
		}
		return parameterString;
	}
}