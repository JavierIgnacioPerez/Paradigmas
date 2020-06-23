namespace Chatbot.FrontEnd.Views
{
    partial class RateView
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(RateView));
            this.Rate1_Button = new System.Windows.Forms.Button();
            this.Rate_TextBox = new System.Windows.Forms.TextBox();
            this.Warning_TextBox = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.Evaluacion_CheckBox = new System.Windows.Forms.CheckBox();
            this.label3 = new System.Windows.Forms.Label();
            this.Cuestionario_CheckBox = new System.Windows.Forms.CheckBox();
            this.label4 = new System.Windows.Forms.Label();
            this.Coherencia_TextBox = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.Proposito_TextBox = new System.Windows.Forms.TextBox();
            this.Rate2_Button = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // Rate1_Button
            // 
            this.Rate1_Button.Location = new System.Drawing.Point(18, 144);
            this.Rate1_Button.Name = "Rate1_Button";
            this.Rate1_Button.Size = new System.Drawing.Size(75, 20);
            this.Rate1_Button.TabIndex = 0;
            this.Rate1_Button.Text = "Rate";
            this.Rate1_Button.UseVisualStyleBackColor = true;
            this.Rate1_Button.Click += new System.EventHandler(this.Rate_Button_Click);
            // 
            // Rate_TextBox
            // 
            this.Rate_TextBox.Location = new System.Drawing.Point(18, 104);
            this.Rate_TextBox.Name = "Rate_TextBox";
            this.Rate_TextBox.Size = new System.Drawing.Size(89, 20);
            this.Rate_TextBox.TabIndex = 3;
            // 
            // Warning_TextBox
            // 
            this.Warning_TextBox.Location = new System.Drawing.Point(18, 268);
            this.Warning_TextBox.Multiline = true;
            this.Warning_TextBox.Name = "Warning_TextBox";
            this.Warning_TextBox.ReadOnly = true;
            this.Warning_TextBox.Size = new System.Drawing.Size(433, 20);
            this.Warning_TextBox.TabIndex = 5;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(110, 9);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(236, 13);
            this.label2.TabIndex = 6;
            this.label2.Text = "Para evaluar al Chatbot debe marcar una casilla.";
            // 
            // Evaluacion_CheckBox
            // 
            this.Evaluacion_CheckBox.AutoSize = true;
            this.Evaluacion_CheckBox.Location = new System.Drawing.Point(16, 43);
            this.Evaluacion_CheckBox.Name = "Evaluacion_CheckBox";
            this.Evaluacion_CheckBox.Size = new System.Drawing.Size(126, 17);
            this.Evaluacion_CheckBox.TabIndex = 7;
            this.Evaluacion_CheckBox.Text = "Evaluar directamente";
            this.Evaluacion_CheckBox.UseVisualStyleBackColor = true;
            this.Evaluacion_CheckBox.CheckedChanged += new System.EventHandler(this.Evaluacion_CheckBox_CheckedChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(13, 75);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(163, 13);
            this.label3.TabIndex = 8;
            this.label3.Text = "(Ingresar valor entero entre 0 y 5)";
            // 
            // Cuestionario_CheckBox
            // 
            this.Cuestionario_CheckBox.AutoSize = true;
            this.Cuestionario_CheckBox.Location = new System.Drawing.Point(219, 43);
            this.Cuestionario_CheckBox.Name = "Cuestionario_CheckBox";
            this.Cuestionario_CheckBox.Size = new System.Drawing.Size(84, 17);
            this.Cuestionario_CheckBox.TabIndex = 9;
            this.Cuestionario_CheckBox.Text = "Cuestionario";
            this.Cuestionario_CheckBox.UseVisualStyleBackColor = true;
            this.Cuestionario_CheckBox.CheckedChanged += new System.EventHandler(this.Cuestionario_CheckBox_CheckedChanged);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(216, 75);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(163, 13);
            this.label4.TabIndex = 10;
            this.label4.Text = "(Ingresar valor entero entre 0 y 5)";
            // 
            // Coherencia_TextBox
            // 
            this.Coherencia_TextBox.Location = new System.Drawing.Point(216, 126);
            this.Coherencia_TextBox.Name = "Coherencia_TextBox";
            this.Coherencia_TextBox.Size = new System.Drawing.Size(84, 20);
            this.Coherencia_TextBox.TabIndex = 11;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(216, 104);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(235, 13);
            this.label1.TabIndex = 12;
            this.label1.Text = "¿Fueron las respuestas del Chatbot coherentes?";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(216, 161);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(167, 13);
            this.label5.TabIndex = 13;
            this.label5.Text = "¿El Chatbot cumplio su proposito?";
            // 
            // Proposito_TextBox
            // 
            this.Proposito_TextBox.Location = new System.Drawing.Point(216, 189);
            this.Proposito_TextBox.Name = "Proposito_TextBox";
            this.Proposito_TextBox.Size = new System.Drawing.Size(84, 20);
            this.Proposito_TextBox.TabIndex = 14;
            // 
            // Rate2_Button
            // 
            this.Rate2_Button.Location = new System.Drawing.Point(216, 226);
            this.Rate2_Button.Name = "Rate2_Button";
            this.Rate2_Button.Size = new System.Drawing.Size(75, 20);
            this.Rate2_Button.TabIndex = 15;
            this.Rate2_Button.Text = "Rate";
            this.Rate2_Button.UseVisualStyleBackColor = true;
            this.Rate2_Button.Click += new System.EventHandler(this.Rate2_Button_Click);
            // 
            // RateView
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(472, 300);
            this.Controls.Add(this.Rate2_Button);
            this.Controls.Add(this.Proposito_TextBox);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.Coherencia_TextBox);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.Cuestionario_CheckBox);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.Evaluacion_CheckBox);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.Warning_TextBox);
            this.Controls.Add(this.Rate_TextBox);
            this.Controls.Add(this.Rate1_Button);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "RateView";
            this.Text = "RateView";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button Rate1_Button;
        private System.Windows.Forms.TextBox Rate_TextBox;
        private System.Windows.Forms.TextBox Warning_TextBox;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.CheckBox Evaluacion_CheckBox;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.CheckBox Cuestionario_CheckBox;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox Coherencia_TextBox;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox Proposito_TextBox;
        private System.Windows.Forms.Button Rate2_Button;
    }
}