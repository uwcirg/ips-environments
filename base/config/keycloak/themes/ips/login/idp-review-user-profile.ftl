<#import "template.ftl" as layout>
<#import "user-profile-commons.ftl" as userProfileCommons>
<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
    <#if section = "header">
        ${msg("loginIdpReviewProfileTitle")}
    <#elseif section = "form">
        <form id="kc-idp-review-profile-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">

            <@userProfileCommons.userProfileFormFields/>

            <script>
              document.addEventListener("DOMContentLoaded", () => {
                const emailInput = document.getElementById("email");
                const emailFormGroup = emailInput?.closest("div.form-group");
                if (emailFormGroup) {
                  emailFormGroup.style.display = "none";
                }

                const ghostCheckbox = document.getElementById("terms_and_conditions");
                if (!ghostCheckbox) return;
                const ghostFormGroup = ghostCheckbox?.closest("div.form-group");
                ghostFormGroup.style.display = "none";

                const checkbox = document.getElementsByName("terms-conditions")[0];
                
                if (!checkbox || !ghostCheckbox) return;
                checkbox.addEventListener("change", () => {
                  ghostCheckbox.value = checkbox.checked
                    ? Math.floor(Date.now() / 1000).toString()
                    : "";
                });
              });
            </script>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input style="margin-bottom: 1em" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}" />
                    <button class="gsi-material-button" style="width:100%; font-size: var(--default-body-font-size)" onclick="location.href='${url.loginUrl}'">
                      <div class="gsi-material-button-state"></div>
                      <div class="gsi-material-button-content-wrapper">
                              Cancel
                      </div>
                    </button>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>