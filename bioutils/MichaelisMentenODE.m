function dSdt = MichaelisMentenODE(t, S)
    % �����ʼ����
    Vmax = 1.5; % ���Ӧ����
    Km = 0.3; % ���ϳ���
    j_x = 0.6; % ������ⲿ��������
    % ���㷴Ӧ����
    v = (Vmax * S) / (Km + S);
    % ����Ũ�ȵı仯����
    dSdt = j_x - v;
end