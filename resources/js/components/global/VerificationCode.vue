<template>
    <div>
        <!-- verification code matching Modal -->
        <div class="modal fade" id="confirmCodeModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="card c-global-radius">
                        <div class="card-body">
                            <form class="row g-3">
                                <div class="col-12">
                                    <label for="code" class="form-label">{{
                                        translate(
                                            "Enter confirmation code sent to your email"
                                        )
                                    }}</label>
                                    <input
                                        type="email"
                                        class="form-control"
                                        v-model="
                                            codeConfirmation.confirmation_code
                                        "
                                        :placeholder="translate('Code')"
                                    />
                                    <div
                                        v-if="
                                            codeConfirmationErrors.confirmation_code
                                        "
                                        class="invalid-feedback"
                                    >
                                        {{
                                            codeConfirmationErrors
                                                .confirmation_code[0]
                                        }}
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="col-12 mt-2">
                                        <button
                                            v-if="codeConfirmationStatus == 1"
                                            type="button"
                                            @click="matchVerificationCode"
                                            class="btn c-btn-theme-yellow text-white w-100"
                                        >
                                            {{ translate("Verify") }}
                                        </button>
                                        <button
                                            v-else
                                            class="btn c-btn-theme-yellow text-white w-100"
                                            type="button"
                                            disabled
                                        >
                                            {{ translate("Verifying") }}
                                            <span
                                                class="spinner-border spinner-border-sm"
                                                role="status"
                                                aria-hidden="true"
                                            ></span>
                                        </button>
                                    </div>
                                </div>
                                <div v-if="resendButtonActivateStatus">
                                    <button
                                        v-if="resenBtnStatus == 1"
                                        type="button"
                                        @click="checkStatus"
                                        class="btn c-btn-theme-yellow text-white w-100"
                                    >
                                        {{ translate("Resend code") }}
                                    </button>
                                    <button
                                        v-else
                                        class="btn c-btn-theme-yellow text-white w-100"
                                        type="button"
                                        disabled
                                    >
                                        {{ translate("Sending") }}
                                        <span
                                            class="spinner-border spinner-border-sm"
                                            role="status"
                                            aria-hidden="true"
                                        ></span>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <button
            data-bs-toggle="modal"
            data-bs-target="#confirmCodeModal"
            style="display: none"
            ref="openConfirmationCodeModal"
        ></button>

        <button
            style="display: none"
            ref="closeConfirmationCodeModal"
            type="button"
            class="btn btn-sm btn-dark"
            data-bs-dismiss="modal"
            data-bs-target="#confirmCodeModal"
        >
            Close
        </button>
    </div>
</template>

<script>
export default {
    props: ["email"],
    mounted() {
        this.$nextTick(() => {
            this.$refs.openConfirmationCodeModal.click();
            this.checkStatus();
            this.startTimer();
        });
    }, 
    data() {
        return { 
            emits: ["parentProcesses"],
            codeConfirmationStatus: 1,
            codeConfirmation: {
                confirmation_code: "",
                email: this.email,
                status: "",
            },
            codeConfirmationErrors: [],
            resenBtnStatus: 1,
            resendButtonActivateStatus: false,
        };
    },
    methods: {
        startTimer() {
            // Set timeout to activate resend button after 5 seconds
            this.timer = setTimeout(() => {
                this.resendButtonActivateStatus = true;
            }, 30000); // 30 seconds
        },
        resetTime() {
            // Clear the existing timeout and start a new one
            clearTimeout(this.timer);
        },
        checkStatus() {
            this.resenBtnStatus = 0;
            this.codeConfirmation.status = "not-verified";
            this.matchVerificationCode();
            this.resetTime();
            this.resendButtonActivateStatus = false;
        },
        matchVerificationCode() {
            this.codeConfirmationStatus = 0;
            axios
                .post("/api/match-verification-code", this.codeConfirmation)
                .then((response) => {
                    this.codeConfirmationStatus = 1;
                    if (this.codeConfirmation.status == "not-verified") {
                        this.resenBtnStatus = 1;
                        this.codeConfirmation.status = "";
                        this.startTimer();
                        toastr.success(
                            this.translate(
                                "Your account is not verified. Please check your email for a six-digit verification code and enter it in the input field to verify your account."
                            )
                        );
                    } else {
                        this.$refs.closeConfirmationCodeModal.click();
                        this.$emit("parentProcesses");
                    }
                })
                .catch((error) => {
                    this.codeConfirmationStatus = 1;
                    this.resenBtnStatus = 1;
                    toastr.error(error.response.data.message);
                    if (error.response.data.errors) {
                        this.codeConfirmationErrors =
                            error.response.data.errors;
                    }
                });
        },
    },
};
</script>

<style lang="scss" scoped></style>
