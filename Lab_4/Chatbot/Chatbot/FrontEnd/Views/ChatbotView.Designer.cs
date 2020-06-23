namespace Chatbot.FrontEnd.Views
{
    partial class ChatbotView
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ChatbotView));
            this.BeginDialog_Button = new System.Windows.Forms.Button();
            this.EndDialog_Button = new System.Windows.Forms.Button();
            this.Chatbot_TextBox = new System.Windows.Forms.TextBox();
            this.SendMessage_Button = new System.Windows.Forms.Button();
            this.SendMessage_TextBox = new System.Windows.Forms.TextBox();
            this.LoadLog_Button = new System.Windows.Forms.Button();
            this.SaveLog_Button = new System.Windows.Forms.Button();
            this.BeginDialog_TextBox = new System.Windows.Forms.TextBox();
            this.saveFileDialog1 = new System.Windows.Forms.SaveFileDialog();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.ShowRates_Button = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // BeginDialog_Button
            // 
            this.BeginDialog_Button.Location = new System.Drawing.Point(598, 45);
            this.BeginDialog_Button.Name = "BeginDialog_Button";
            this.BeginDialog_Button.Size = new System.Drawing.Size(89, 23);
            this.BeginDialog_Button.TabIndex = 0;
            this.BeginDialog_Button.Text = "BeginDialog";
            this.BeginDialog_Button.UseVisualStyleBackColor = true;
            this.BeginDialog_Button.Click += new System.EventHandler(this.BeginDialog_Button_Click);
            // 
            // EndDialog_Button
            // 
            this.EndDialog_Button.Location = new System.Drawing.Point(598, 85);
            this.EndDialog_Button.Name = "EndDialog_Button";
            this.EndDialog_Button.Size = new System.Drawing.Size(89, 23);
            this.EndDialog_Button.TabIndex = 1;
            this.EndDialog_Button.Text = "EndDialog";
            this.EndDialog_Button.UseVisualStyleBackColor = true;
            this.EndDialog_Button.Click += new System.EventHandler(this.EndDialog_Button_Click);
            // 
            // Chatbot_TextBox
            // 
            this.Chatbot_TextBox.Location = new System.Drawing.Point(44, 28);
            this.Chatbot_TextBox.MaximumSize = new System.Drawing.Size(520, 250);
            this.Chatbot_TextBox.MinimumSize = new System.Drawing.Size(520, 250);
            this.Chatbot_TextBox.Multiline = true;
            this.Chatbot_TextBox.Name = "Chatbot_TextBox";
            this.Chatbot_TextBox.ReadOnly = true;
            this.Chatbot_TextBox.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.Chatbot_TextBox.Size = new System.Drawing.Size(520, 250);
            this.Chatbot_TextBox.TabIndex = 2;
            // 
            // SendMessage_Button
            // 
            this.SendMessage_Button.Location = new System.Drawing.Point(598, 255);
            this.SendMessage_Button.Name = "SendMessage_Button";
            this.SendMessage_Button.Size = new System.Drawing.Size(89, 23);
            this.SendMessage_Button.TabIndex = 3;
            this.SendMessage_Button.Text = "SendMessage";
            this.SendMessage_Button.UseVisualStyleBackColor = true;
            this.SendMessage_Button.Click += new System.EventHandler(this.SendMessage_Button_Click);
            // 
            // SendMessage_TextBox
            // 
            this.SendMessage_TextBox.Location = new System.Drawing.Point(598, 218);
            this.SendMessage_TextBox.Name = "SendMessage_TextBox";
            this.SendMessage_TextBox.Size = new System.Drawing.Size(232, 20);
            this.SendMessage_TextBox.TabIndex = 4;
            // 
            // LoadLog_Button
            // 
            this.LoadLog_Button.Location = new System.Drawing.Point(598, 126);
            this.LoadLog_Button.Name = "LoadLog_Button";
            this.LoadLog_Button.Size = new System.Drawing.Size(89, 23);
            this.LoadLog_Button.TabIndex = 5;
            this.LoadLog_Button.Text = "LoadLog";
            this.LoadLog_Button.UseVisualStyleBackColor = true;
            this.LoadLog_Button.Click += new System.EventHandler(this.LoadLog_Button_Click);
            // 
            // SaveLog_Button
            // 
            this.SaveLog_Button.Location = new System.Drawing.Point(598, 169);
            this.SaveLog_Button.Name = "SaveLog_Button";
            this.SaveLog_Button.Size = new System.Drawing.Size(89, 23);
            this.SaveLog_Button.TabIndex = 6;
            this.SaveLog_Button.Text = "SaveLog";
            this.SaveLog_Button.UseVisualStyleBackColor = true;
            this.SaveLog_Button.Click += new System.EventHandler(this.SaveLog_Button_Click);
            // 
            // BeginDialog_TextBox
            // 
            this.BeginDialog_TextBox.Location = new System.Drawing.Point(693, 45);
            this.BeginDialog_TextBox.MaximumSize = new System.Drawing.Size(20, 22);
            this.BeginDialog_TextBox.MinimumSize = new System.Drawing.Size(20, 22);
            this.BeginDialog_TextBox.Name = "BeginDialog_TextBox";
            this.BeginDialog_TextBox.Size = new System.Drawing.Size(20, 20);
            this.BeginDialog_TextBox.TabIndex = 8;
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // ShowRates_Button
            // 
            this.ShowRates_Button.Location = new System.Drawing.Point(735, 169);
            this.ShowRates_Button.Name = "ShowRates_Button";
            this.ShowRates_Button.Size = new System.Drawing.Size(75, 23);
            this.ShowRates_Button.TabIndex = 9;
            this.ShowRates_Button.Text = "Show Rates";
            this.ShowRates_Button.UseVisualStyleBackColor = true;
            this.ShowRates_Button.Click += new System.EventHandler(this.ShowRates_Button_Click);
            // 
            // ChatbotView
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(842, 304);
            this.Controls.Add(this.ShowRates_Button);
            this.Controls.Add(this.BeginDialog_TextBox);
            this.Controls.Add(this.SaveLog_Button);
            this.Controls.Add(this.LoadLog_Button);
            this.Controls.Add(this.SendMessage_TextBox);
            this.Controls.Add(this.SendMessage_Button);
            this.Controls.Add(this.Chatbot_TextBox);
            this.Controls.Add(this.EndDialog_Button);
            this.Controls.Add(this.BeginDialog_Button);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "ChatbotView";
            this.Text = "Chatbot";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button BeginDialog_Button;
        private System.Windows.Forms.Button EndDialog_Button;
        private System.Windows.Forms.Button SendMessage_Button;
        private System.Windows.Forms.TextBox SendMessage_TextBox;
        private System.Windows.Forms.Button LoadLog_Button;
        private System.Windows.Forms.Button SaveLog_Button;
        private System.Windows.Forms.TextBox BeginDialog_TextBox;
        private System.Windows.Forms.TextBox Chatbot_TextBox;
        private System.Windows.Forms.SaveFileDialog saveFileDialog1;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.Button ShowRates_Button;
    }
}